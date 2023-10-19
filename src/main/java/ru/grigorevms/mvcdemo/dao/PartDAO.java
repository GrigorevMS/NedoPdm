package ru.grigorevms.mvcdemo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.server.MediaTypeNotSupportedStatusException;
import ru.grigorevms.mvcdemo.models.Part;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class PartDAO {
    private DatabaseConnector dbConnector;

    @Autowired
    public PartDAO(DatabaseConnector dbConnector) {
        this.dbConnector = dbConnector;
    }

    public Part getPart(Long id) {
        String sql = String.format("SELECT * FROM parts WHERE id=%d;", id);
        ResultSet result = dbConnector.executeSelect(sql);
        try {
            if (!result.next())  return null;
            Array parentsArr = result.getArray("parents");
            List<Long> parents = new ArrayList<>();

            try {
                if (parentsArr != null) {
                    Long[] temp = (Long[]) parentsArr.getArray();
                    for (int i = 0; i < temp.length; i++) {
                        parents.add(temp[i]);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return new Part(result.getLong("id"),
                    result.getString("description"),
                    result.getString("name"),
                    parents,
                    result.getString("text"),
                    result.getInt("count"));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public List<Part> getAllParts() {
        String sql = "SELECT * FROM parts;";
        ResultSet result = dbConnector.executeSelect(sql);
        List<Part> parts = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                Array parentsArr = result.getArray("parents");
                List<Long> parents = new ArrayList<>();

                try {
                    if (parentsArr != null) {
                        Long[] temp = (Long[]) parentsArr.getArray();
                        for (int i = 0; i < temp.length; i++) {
                            parents.add(temp[i]);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                parts.add(new Part(result.getLong("id"),
                        result.getString("description"),
                        result.getString("name"),
                        parents,
                        result.getString("text"),
                        result.getInt("count")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return parts;
    }

    public List<Part> getRootParts() {
        String sql = "SELECT * FROM PARTS WHERE parents IS NULL;";
        ResultSet result = dbConnector.executeSelect(sql);
        List<Part> parts = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                Array parentsArr = result.getArray("parents");
                List<Long> parents = new ArrayList<>();

                try {
                    if (parentsArr != null) {
                        Long[] temp = (Long[]) parentsArr.getArray();
                        for (int i = 0; i < temp.length; i++) {
                            parents.add(temp[i]);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Part forAdd = new Part(result.getLong("id"),
                        result.getString("description"),
                        result.getString("name"),
                        parents,
                        result.getString("text"),
                        result.getInt("count"));
                forAdd.setLevel(0);
                parts.add(forAdd);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return parts;
    }

    public List<Part> getPartsTree() {
        List<Part> result = new ArrayList<>();
        List<Part> queue = getRootParts();
        while (queue.size() > 0) {
            Part root = queue.remove(0);
            result.add(root);
            List<Part> children = getChildParts(root);
            for (Part part : children)  part.setLevel(root.getLevel() + 1);
            queue.addAll(0, children);
        }
        return result;
    }

    public List<Part> getChildParts(Part root) {
        String sql = String.format("SELECT * FROM parts WHERE array_position(parents, %d) IS NOT NULL;",
                root.getId());
        ResultSet result = dbConnector.executeSelect(sql);
        List<Part> parts = new ArrayList<>();
        while (true) {
            try {
                if (!result.next()) break;
                Array parentsArr = result.getArray("parents");
                List<Long> parents = new ArrayList<>();

                try {
                    if (parentsArr != null) {
                        Long[] temp = (Long[]) parentsArr.getArray();
                        for (int i = 0; i < temp.length; i++) {
                            parents.add(temp[i]);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

                parts.add(new Part(result.getLong("id"),
                        result.getString("description"),
                        result.getString("name"),
                        parents,
                        result.getString("text"),
                        result.getInt("count")));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return parts;
    }

    public int addPart(Part newPart) {
        String sql = "";
        if (newPart.getParents() == null) {
            sql = String.format("INSERT INTO parts (description, name, parents, text, count) VALUES ('%s', '%s', %d, '%s', %d);",
                    newPart.getDescription(), newPart.getName(), newPart.getParents(), newPart.getText(), newPart.getCount());
        } else {
            String array = "{";
            List<Long> parents = newPart.getParents();
            for (int i = 0; i < parents.size() - 1; i++) {
                array = array + parents.get(i) + ", ";
            }
            array = array + parents.get(parents.size() - 1) + "}";
            sql = String.format("INSERT INTO parts (description, name, parents, text, count) VALUES ('%s', '%s', '%s', '%s', %d);",
                    newPart.getDescription(), newPart.getName(), array, newPart.getText(), newPart.getCount());
        }
        return dbConnector.executeUpdate(sql);
    }

    public int updatePart(Part partForUpdate) {
        String sql = "";
        if (partForUpdate.getParents() == null) {
            sql = String.format("UPDATE parts SET (description, name, parents, text, count) " +
                            "= ('%s', '%s', %d, '%s', %d) WHERE id=%d;",
                    partForUpdate.getDescription(),
                    partForUpdate.getName(),
                    partForUpdate.getParents(),
                    partForUpdate.getText(),
                    partForUpdate.getCount(),
                    partForUpdate.getId());
        } else {
            String array = "{";
            List<Long> parents = partForUpdate.getParents();
            for (int i = 0; i < parents.size() - 1; i++) {
                array = array + parents.get(i) + ", ";
            }
            array = array + parents.get(parents.size() - 1) + "}";
            sql = String.format("UPDATE parts SET (description, name, parents, text, count) " +
                            "= ('%s', '%s', '%s', '%s', %d) WHERE id=%d;",
                    partForUpdate.getDescription(),
                    partForUpdate.getName(),
                    array,
                    partForUpdate.getText(),
                    partForUpdate.getCount(),
                    partForUpdate.getId());
        }
        System.out.println(sql);
        return dbConnector.executeUpdate(sql);
    }

    public int deletePart(Part partForDelete) {
        String sql = String.format("DELETE FROM parts WHERE id=%d",
                partForDelete.getId());
        return dbConnector.executeUpdate(sql);
    }
}

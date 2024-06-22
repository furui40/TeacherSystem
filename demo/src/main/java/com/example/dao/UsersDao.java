package com.example.dao;

import com.example.entity.User;
import java.util.List;

public interface UsersDao {
    int saveUser(User user);
    int createUser(User user);
    User getUserById(int id);
    User getUserByUsername(String username);
    List<User> getAllUsers();
    void updateUser(User user);
    void deleteUser(int id);
}

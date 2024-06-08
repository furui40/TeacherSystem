package com.example.dao.impl;

import com.example.dao.ResearchDao;
import com.example.db.DBUtil;
import com.example.entity.Research;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResearchDaoImpl implements ResearchDao {
    @Override
    public void saveResearch(Research research) {
        String sql = "INSERT INTO Research (TeacherID, Title, Description, Date) VALUES (?, ?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, research.getTeacherID(), research.getTitle(), research.getDescription(), new Date(research.getDate().getTime()));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public Research getResearchById(int id) {
        String sql = "SELECT * FROM Research WHERE ResearchID = ?";
        Research research = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, id);
            if (rs.next()) {
                research = new Research();
                research.setResearchID(rs.getInt("ResearchID"));
                research.setTeacherID(rs.getInt("TeacherID"));
                research.setTitle(rs.getString("Title"));
                research.setDescription(rs.getString("Description"));
                research.setDate(rs.getDate("Date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return research;
    }

    @Override
    public List<Research> getResearchByTeacherId(int teacherId) {
        String sql = "SELECT * FROM Research WHERE TeacherID = ?";
        List<Research> researches = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, teacherId);
            while (rs.next()) {
                Research research = new Research();
                research.setResearchID(rs.getInt("ResearchID"));
                research.setTeacherID(rs.getInt("TeacherID"));
                research.setTitle(rs.getString("Title"));
                research.setDescription(rs.getString("Description"));
                research.setDate(rs.getDate("Date"));
                researches.add(research);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return researches;
    }

    @Override
    public List<Research> getAllResearches() {
        String sql = "SELECT * FROM Research";
        List<Research> researches = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                Research research = new Research();
                research.setResearchID(rs.getInt("ResearchID"));
                research.setTeacherID(rs.getInt("TeacherID"));
                research.setTitle(rs.getString("Title"));
                research.setDescription(rs.getString("Description"));
                research.setDate(rs.getDate("Date"));
                researches.add(research);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return researches;
    }

    @Override
    public void updateResearch(Research research) {
        String sql = "UPDATE Research SET TeacherID = ?, Title = ?, Description = ?, Date = ? WHERE ResearchID = ?";
        try {
            DBUtil.executeUpdate(sql, research.getTeacherID(), research.getTitle(), research.getDescription(), new Date(research.getDate().getTime()), research.getResearchID());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteResearch(int id) {
        String sql = "DELETE FROM Research WHERE ResearchID = ?";
        try {
            DBUtil.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }
}

package com.example.dao;

import com.example.entity.Research;
import java.util.List;

public interface ResearchDao {
    void saveResearch(Research research);
    Research getResearchById(int id);
    List<Research> getResearchByTeacherId(int teacherId);
    List<Research> getAllResearches();
    void updateResearch(Research research);
    void deleteResearch(int id);
}

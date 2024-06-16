package com.example.utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class DateUtils {

    public static List<String> generateMonthDates(LocalDate start, LocalDate end) {
        List<String> dates = new ArrayList<>();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate current = start;
        while (!current.isAfter(end)) {
            dates.add(current.format(dateFormatter));
            current = current.plusDays(1);
        }
        return dates;
    }
}

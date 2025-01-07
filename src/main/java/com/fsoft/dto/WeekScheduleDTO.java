package com.fsoft.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class WeekScheduleDTO {
    private Long id;
    private String startDate;
    private String endDate;
    private List<WorkScheduleDTO> workSchedules;
}

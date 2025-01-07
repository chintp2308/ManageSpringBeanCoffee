package com.fsoft.dto;

import com.fsoft.enums.ShiftType;
import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class ShiftDTO {
    private Long id;
    private ShiftType shiftType;
    private String startTime;
    private String endTime;
    private int maxEmployee;
    private double salary;
}

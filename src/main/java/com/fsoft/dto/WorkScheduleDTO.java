package com.fsoft.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class WorkScheduleDTO {
    private Long id;
    private String date;
    private ShiftDTO shift;
    private AccountDTO account;
    private Boolean isActive;
    private Boolean isCheckIn;
    private Boolean isCheckOut;
}

package com.fsoft.dto;

import com.fsoft.entity.AccountEntity;
import com.fsoft.enums.LogType;
import jdk.jfr.Timespan;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

/**
 * DTO for {@link com.fsoft.entity.LogEntity}
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class LogDTO implements Serializable {
    private Long id;
    private AccountEntity account;
    private LogType action;
    private Boolean status;
    private Date createdDate;
}
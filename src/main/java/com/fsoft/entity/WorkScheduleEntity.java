package com.fsoft.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_work_schedule")
public class WorkScheduleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "work_date")
    @Temporal(TemporalType.DATE)
    private Date date;

    @Column(name = "work_is_active")
    private Boolean isActive;

    @Column(name = "work_is_checkin")
    private Boolean isCheckin;

    @Column(name = "work_is_checkout")
    private Boolean isCheckout;

    @ManyToOne
    @JoinColumn(name = "shift_id")
    private ShiftEntity shift;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private AccountEntity account;

    @ManyToOne
    @JoinColumn(name = "week_schedule_id")
    @JsonIgnore
    private WeekSchedule weekSchedule;


    public void setDate(String date) {
        Date date_work = new Date();
        try {
            date_work = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        this.date = date_work;
    }

}

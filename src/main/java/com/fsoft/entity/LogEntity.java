package com.fsoft.entity;

import com.fsoft.enums.LogType;
import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_log")
public class LogEntity extends BaseEnity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
    private String time;
    private String date;
    @Enumerated(EnumType.STRING)
    private LogType action;
    private Boolean status;
    @ManyToOne
    @JoinColumn(name = "account_id")
    private AccountEntity account;


}

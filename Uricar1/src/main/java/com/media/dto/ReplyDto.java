package com.media.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyDto {
	private int reply_seq;
	private Timestamp r_date;
	private String r_content;
	private int board_seq;
	private String mid;
}

package study.spring.selection.model;

import lombok.Data;

@Data
public class Answer {
	private int answer_no;
	private String answer_content;
	private String reg_date;
	private String answer_writer;
	private int qna_no;
}
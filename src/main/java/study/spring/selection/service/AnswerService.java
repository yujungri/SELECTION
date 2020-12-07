package study.spring.selection.service;

import java.util.List;

import study.spring.selection.model.Answer;

public interface AnswerService {
	/**
	 * Answer 데이터 상세 조회
	 * @param Answer 조회할 상품의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Answer getAnswerItem(Answer input) throws Exception;
	
	/**
	 * Answer 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Answer> getAnswerList(Answer input) throws Exception;
	
	/**
	 * Answer 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getAnswerCount(Answer input) throws Exception;
	
	/**
	 * Answer 데이터 등록하기
	 * @param Answer 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addAnswer(Answer input) throws Exception;
	
	/**
	 * Answer 데이터 수정하기
	 * @param Answer 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editAnswer(Answer input) throws Exception;
	
	/**
	 * Answer 데이터 삭제하기
	 * @param Answer 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteAnswer(Answer input) throws Exception;
}
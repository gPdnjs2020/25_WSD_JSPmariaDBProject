package org.example.dao;

import org.example.bean.BoardVO;
import org.example.common.JDBCUtil;
import org.mariadb.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content) values (?, ?, ?)";
    private final String BOARD_UPDATE = "update BOARD set title = ?, writer = ?, content = ? where seq = ?";
    private final String BOARD_DELETE = "delete from BOARD where seq = ?";
    private final String BOARD_GET = "select * from BOARD where seq = ?";
    private final String BOARD_LIST = "select * from BOARD order by seq desc";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getContent());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /*public void deleteBoard(BoardVO vo);

    public int updateBoard(BoardVO vo);

    public BoardVO getBoard(int seq);

    public List<BoardVO> getBoardList();*/

    public static void main(String args[]) {
        BoardVO vo = new BoardVO("글 제목입니다.", "Sally", "글 내용입니다.");
        BoardDAO boardDAO = new BoardDAO();
        int result = boardDAO.insertBoard(vo);
        if (result == 1) {
            System.out.println("데이터 추가 완료!");
        }
    }
}

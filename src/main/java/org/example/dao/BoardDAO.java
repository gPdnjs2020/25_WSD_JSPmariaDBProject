package org.example.dao;

import org.example.bean.BoardVO;
import org.example.common.JDBCUtil;
import org.mariadb.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into Board (title, writer, content) values (?, ?, ?)";
    private final String BOARD_LIST = "select * from Board order by regdate desc";
    private final String BOARD_UPDATE = "update Board set title = ?, writer = ?, content = ? where id = ?";
    private final String BOARD_DELETE = "delete from Board where id = ?";
    private final String BOARD_GET = "select * from Board where id = ?";

        public List<BoardVO> getBoardList() throws SQLException {
            List<BoardVO> list = new ArrayList<BoardVO>();
            System.out.println("===> JDBC로 insertBoard() 기능 처리");
            try {
                conn = JDBCUtil.getConnection();
                stmt = conn.prepareStatement(BOARD_LIST);
                rs=stmt.executeQuery();
                while (rs.next()) {
                    BoardVO one = new BoardVO();
                    one.setId(rs.getInt("id"));
                    one.setTitle(rs.getString("title"));
                    one.setWriter(rs.getString("writer"));
                    one.setContent(rs.getString("content"));
                    one.setRegdate(rs.getDate("regdate"));
                    one.setCnt(rs.getInt("cnt"));
                    list.add(one);
                }
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }

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

    public void deleteBoard(BoardVO vo){
        try {
            conn = JDBCUtil.getConnection();
            String sql = "delete from Board where id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, vo.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<BoardVO> searchBoardList(String search) throws SQLException {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT * FROM Board WHERE title LIKE ? OR content LIKE ? ORDER BY regdate DESC";
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            String keyword = "%" + search + "%";
            stmt.setString(1, keyword);
            stmt.setString(2, keyword);
            rs = stmt.executeQuery();
            while (rs.next()) {
                BoardVO one = new BoardVO();
                one.setId(rs.getInt("id"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setRegdate(rs.getDate("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    /*public int updateBoard(BoardVO vo);

    public BoardVO getBoard(int id);

    public List<BoardVO> getBoardList();*/

    /*public static void main(String args[]) {
        BoardVO vo = new BoardVO("글 제목입니다.", "Sally", "글 내용입니다.");
        BoardDAO boardDAO = new BoardDAO();
        int result = boardDAO.insertBoard(vo);
        if (result == 1) {
            System.out.println("데이터 추가 완료!");
        }
    }*/
}

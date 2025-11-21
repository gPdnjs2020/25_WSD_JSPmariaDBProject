package org.example.dao;

import org.example.bean.BoardVO;
import org.mariadb.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class boardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content) values (?, ?, ?)";
    private final String BOARD_UPDATE = "update BOARD set title = ?, writer = ?, content = ? where seq = ?";
    private final String BOARD_DELETE = "delete from BOARD where seq = ?";
    private final String BOARD_GET = "select * from BOARD where seq = ?";
    private final String BOARD_LIST = "select * from BOARD order by seq desc";

    public int insertBoard(BoardVO vo);
    public void deleteBoard(BoardVO vo);
    public int updateBoard(BoardVO vo);
    public BoardVO getBoard(int seq)

}

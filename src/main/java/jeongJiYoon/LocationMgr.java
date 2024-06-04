package jeongJiYoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LocationMgr {
	
	private DBConnectionMgr pool;

    public LocationMgr() {
        pool = DBConnectionMgr.getInstance();
    }
    
 // location 테이블에서 모든 위치 정보를 가져오는 메서드
    public List<LocationBean> getAllLocations() {
        List<LocationBean> locations = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String sql = "SELECT * FROM location";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                LocationBean location = new LocationBean();
                location.setNum(rs.getInt("num"));
                location.setId(rs.getString("id"));
                location.setPostnum(rs.getString("postnum"));
                location.setCity(rs.getString("city"));
                location.setStreetaddr(rs.getString("streetaddr"));
                location.setParking(rs.getBoolean("parking"));
                location.setSize(rs.getInt("size"));
                location.setCallnum(rs.getString("callnum"));
                location.setCompanyinfo(rs.getString("companyinfo"));
                locations.add(location);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return locations;
    }

    // location 테이블에 새로운 위치 정보를 삽입하는 메서드
    public void addLocation(LocationBean location) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = pool.getConnection();
            String sql = "INSERT INTO location (id, postnum, city, streetaddr, parking, size, callnum, companyinfo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, location.getId());
            pstmt.setString(2, location.getPostnum());
            pstmt.setString(3, location.getCity());
            pstmt.setString(4, location.getStreetaddr());
            pstmt.setBoolean(5, location.isParking());
            pstmt.setInt(6, location.getSize());
            pstmt.setString(7, location.getCallnum());
            pstmt.setString(8, location.getCompanyinfo());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }
    
}

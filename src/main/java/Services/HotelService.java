package Services;

import Model.Booking;
import Model.Hotel;
import Utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HotelService {

    private final Connection con = DBConnect.getConnection();

    public boolean createHotel(Hotel hotel) {
        String query = "INSERT INTO hotels (hotelName, location, price ,mobile) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, hotel.getHotelName());
            ps.setString(2, hotel.getLocation());
            ps.setDouble(3, hotel.getPrice());
            ps.setString(4, hotel.getMobile());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHotel(Hotel hotel) {
        String query = "UPDATE hotels SET hotelName = ?, location = ?, price = ?, mobile = ? WHERE hotelId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, hotel.getHotelName());
            ps.setString(2, hotel.getLocation());
            ps.setDouble(3, hotel.getPrice());
            ps.setString(4, hotel.getMobile());
            ps.setInt(5, hotel.getHotelId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteHotel(int hotelId) {
        String query = "DELETE FROM hotels WHERE hotelId = ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, hotelId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public Hotel getHotelById(int hotelId) {
        String query = "SELECT * FROM hotels WHERE hotelId = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, hotelId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setHotelId(rs.getInt("hotelId"));
                hotel.setHotelName(rs.getString("hotelName"));
                hotel.setLocation(rs.getString("location"));
                hotel.setPrice(rs.getDouble("price"));
                hotel.setMobile(rs.getString("mobile"));
                return hotel;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Hotel> getAllHotels() {
        ArrayList<Hotel> hotels = new ArrayList<>();
        String query = "SELECT * FROM hotels";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setHotelId(rs.getInt("hotelId"));
                hotel.setHotelName(rs.getString("hotelName"));
                hotel.setLocation(rs.getString("location"));
                hotel.setPrice(rs.getDouble("price"));
                hotel.setMobile(rs.getString("mobile"));
                hotels.add(hotel);
            }

            return hotels;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}

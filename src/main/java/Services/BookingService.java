package Services;

import Model.Booking;
import Model.TourPackage;
import Utils.DBConnect;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookingService {

    private final Connection con = DBConnect.getConnection();

    //Inserts a new booking record into the database.
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (tourPackageId, userId, bookingDate, noOfAdults, startDate, otherSuggestions, status, customerName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            preparedStatement.setInt(1, booking.getTourPackageId());
            preparedStatement.setInt(2, booking.getUserId());
            preparedStatement.setString(3, booking.getBookingDate());
            preparedStatement.setInt(4, booking.getNoOfAdults());
            preparedStatement.setDate(5, (Date) booking.getStartDate());
            preparedStatement.setString(6, booking.getOtherSuggestions());
            preparedStatement.setString(7, booking.getStatus());
            preparedStatement.setString(8, booking.getCustomerName());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Updates an existing booking based on bookingId.
    public boolean updateBooking(Booking booking) {
        String sql = "UPDATE bookings SET tourPackageId = ?, bookingDate = ?, noOfAdults = ?, startDate = ?, otherSuggestions = ?, status = ?, customerName = ? WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, booking.getTourPackageId());
            preparedStatement.setString(2, booking.getBookingDate());
            preparedStatement.setInt(3, booking.getNoOfAdults());
            preparedStatement.setDate(4, (Date) booking.getStartDate());
            preparedStatement.setString(5, booking.getOtherSuggestions());
            preparedStatement.setString(6, booking.getStatus());
            preparedStatement.setString(7, booking.getCustomerName());
            preparedStatement.setInt(8, booking.getBookingId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Deletes a booking by its ID.
    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM bookings WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, bookingId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public Booking getBookingById(int bookingId) {
        String sql = "SELECT * FROM bookings INNER JOIN users ON users.userId = bookings.userId INNER JOIN tour_packages ON tour_packages.tourPackageId = bookings.tourPackageId WHERE bookingId = ?";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, bookingId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("bookingId"));
                booking.setTourPackageId(resultSet.getInt("tourPackageId"));
                booking.setUserId(resultSet.getInt("userId"));
                booking.setBookingDate(resultSet.getString("bookingDate"));
                booking.setNoOfAdults(resultSet.getInt("noOfAdults"));
                booking.setStartDate(resultSet.getDate("startDate"));
                booking.setOtherSuggestions(resultSet.getString("otherSuggestions"));
                booking.setStatus(resultSet.getString("status"));
                booking.setCustomerName(resultSet.getString("customerName"));
                booking.setTourPackageName(resultSet.getString("packageName"));
                booking.setTourPackageDescription(resultSet.getString("description"));
                booking.setTourPackagePrice(resultSet.getDouble("price"));
                booking.setTourPackageDuration(resultSet.getString("duration"));
                booking.setCustomerEmail(resultSet.getString("email"));
                booking.setCustomerMobile(resultSet.getString("mobile"));
                booking.setCustomerCountry(resultSet.getString("country"));

                return booking;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Booking> getAllBookings() {
        ArrayList<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings INNER JOIN users ON users.userId = bookings.userId INNER JOIN tour_packages ON tour_packages.tourPackageId = bookings.tourPackageId";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("bookingId"));
                booking.setTourPackageId(resultSet.getInt("tourPackageId"));
                booking.setUserId(resultSet.getInt("userId"));
                booking.setBookingDate(resultSet.getString("bookingDate"));
                booking.setNoOfAdults(resultSet.getInt("noOfAdults"));
                booking.setStartDate(resultSet.getDate("startDate"));
                booking.setOtherSuggestions(resultSet.getString("otherSuggestions"));
                booking.setStatus(resultSet.getString("status"));
                booking.setCustomerName(resultSet.getString("customerName"));
                booking.setTourPackageName(resultSet.getString("packageName"));
                booking.setTourPackageDescription(resultSet.getString("description"));
                booking.setTourPackagePrice(resultSet.getDouble("price"));
                booking.setTourPackageDuration(resultSet.getString("duration"));
                booking.setCustomerEmail(resultSet.getString("email"));
                booking.setCustomerMobile(resultSet.getString("mobile"));
                booking.setCustomerCountry(resultSet.getString("country"));

                bookings.add(booking);
            }

            return bookings;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<Booking> getBookingsByUserId(int userId) {
        ArrayList<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings INNER JOIN users ON users.userId = bookings.userId INNER JOIN tour_packages ON tour_packages.tourPackageId = bookings.tourPackageId WHERE bookings.userId = ?";

        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setBookingId(resultSet.getInt("bookingId"));
                booking.setTourPackageId(resultSet.getInt("tourPackageId"));
                booking.setUserId(resultSet.getInt("userId"));
                booking.setBookingDate(resultSet.getString("bookingDate"));
                booking.setNoOfAdults(resultSet.getInt("noOfAdults"));
                booking.setStartDate(resultSet.getDate("startDate"));
                booking.setOtherSuggestions(resultSet.getString("otherSuggestions"));
                booking.setStatus(resultSet.getString("status"));
                booking.setCustomerName(resultSet.getString("customerName"));
                booking.setTourPackageName(resultSet.getString("packageName"));
                booking.setTourPackageDescription(resultSet.getString("description"));
                booking.setTourPackagePrice(resultSet.getDouble("price"));
                booking.setTourPackageDuration(resultSet.getString("duration"));
                booking.setCustomerEmail(resultSet.getString("email"));
                booking.setCustomerMobile(resultSet.getString("mobile"));
                booking.setCustomerCountry(resultSet.getString("country"));

                bookings.add(booking);
            }

            return bookings;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}

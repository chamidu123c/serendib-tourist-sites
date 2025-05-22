package Services;

import Model.TourPackage;
import Utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TourPackageService {

    private final Connection con = DBConnect.getConnection();

    public boolean createTourPackage(TourPackage tourPackage) {

        String sql = "INSERT INTO tour_packages (guideId, packageName, description, price, duration, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            preparedStatement.setInt(1, tourPackage.getGuideId());
            preparedStatement.setString(2, tourPackage.getPackageName());
            preparedStatement.setString(3, tourPackage.getDescription());
            preparedStatement.setDouble(4, tourPackage.getPrice());
            preparedStatement.setString(5, tourPackage.getDuration());
            preparedStatement.setInt(6, tourPackage.getStatus());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;

    }

    public boolean updateTourPackage(TourPackage tourPackage) {
        String sql = "UPDATE tour_packages SET packageName = ?, description = ?, price = ?, duration = ?, status = ? WHERE tourPackageId = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, tourPackage.getPackageName());
            preparedStatement.setString(2, tourPackage.getDescription());
            preparedStatement.setDouble(3, tourPackage.getPrice());
            preparedStatement.setString(4, tourPackage.getDuration());
            preparedStatement.setInt(5, tourPackage.getStatus());
            preparedStatement.setInt(6, tourPackage.getTourPackageId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTourPackage(int tourPackageId) {
        String sql = "DELETE FROM tour_packages WHERE tourPackageId = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, tourPackageId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public TourPackage getTourPackageById(int tourPackageId) {
        String sql = "SELECT * FROM tour_packages INNER JOIN users ON users.userId = tour_packages.guideId WHERE tourPackageId = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, tourPackageId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                TourPackage tourPackage = new TourPackage();
                tourPackage.setTourPackageId(resultSet.getInt("tourPackageId"));
                tourPackage.setGuideId(resultSet.getInt("guideId"));
                tourPackage.setPackageName(resultSet.getString("packageName"));
                tourPackage.setDescription(resultSet.getString("description"));
                tourPackage.setPrice(resultSet.getDouble("price"));
                tourPackage.setDuration(resultSet.getString("duration"));
                tourPackage.setStatus(resultSet.getInt("status"));
                tourPackage.setGuideName(resultSet.getString("name"));
                tourPackage.setGuideEmail(resultSet.getString("email"));
                tourPackage.setGuideMobile(resultSet.getString("mobile"));
                tourPackage.setGuideCountry(resultSet.getString("country"));


                return tourPackage;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<TourPackage> getAllTourPackages() {
        ArrayList<TourPackage> tourPackages = new ArrayList<>();
        String sql = "SELECT * FROM tour_packages INNER JOIN users ON users.userId = tour_packages.guideId";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                TourPackage tourPackage = new TourPackage();
                tourPackage.setTourPackageId(resultSet.getInt("tourPackageId"));
                tourPackage.setGuideId(resultSet.getInt("guideId"));
                tourPackage.setPackageName(resultSet.getString("packageName"));
                tourPackage.setDescription(resultSet.getString("description"));
                tourPackage.setPrice(resultSet.getDouble("price"));
                tourPackage.setDuration(resultSet.getString("duration"));
                tourPackage.setStatus(resultSet.getInt("status"));
                tourPackage.setGuideName(resultSet.getString("name"));
                tourPackage.setGuideEmail(resultSet.getString("email"));
                tourPackage.setGuideMobile(resultSet.getString("mobile"));
                tourPackage.setGuideCountry(resultSet.getString("country"));
                tourPackages.add(tourPackage);
            }

            return tourPackages;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<TourPackage> getTourPackagesByGuideId(int guideId) {
        ArrayList<TourPackage> tourPackages = new ArrayList<>();
        String sql = "SELECT * FROM tour_packages INNER JOIN users ON users.userId = tour_packages.guideId WHERE guideId = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, guideId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                TourPackage tourPackage = new TourPackage();
                tourPackage.setTourPackageId(resultSet.getInt("tourPackageId"));
                tourPackage.setGuideId(resultSet.getInt("guideId"));
                tourPackage.setPackageName(resultSet.getString("packageName"));
                tourPackage.setDescription(resultSet.getString("description"));
                tourPackage.setPrice(resultSet.getDouble("price"));
                tourPackage.setDuration(resultSet.getString("duration"));
                tourPackage.setStatus(resultSet.getInt("status"));
                tourPackage.setGuideName(resultSet.getString("name"));
                tourPackage.setGuideEmail(resultSet.getString("email"));
                tourPackage.setGuideMobile(resultSet.getString("mobile"));
                tourPackage.setGuideCountry(resultSet.getString("country"));
                tourPackages.add(tourPackage);
            }

            return tourPackages;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }
}

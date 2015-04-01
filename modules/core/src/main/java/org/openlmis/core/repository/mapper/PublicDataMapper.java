package org.openlmis.core.repository.mapper;

import org.apache.ibatis.annotations.Select;
import org.openlmis.core.dto.PublicDataDistrictsDTO;
import org.openlmis.core.dto.PublicDataHealthFacilitiesDTO;
import org.openlmis.core.dto.PublicDataProductsDTO;
import org.openlmis.core.dto.PublicDataRegionsDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicDataMapper {

    @Select("SELECT zone_name, region_name, districtcount, facilitycount from (select region_id, zone_name, region_name, count(f.id) facilitycount \n" +
            "from vw_districts d join facilities f ON (district_id = f.geographiczoneid or zone_id = f.geographiczoneid or region_id = f.geographiczoneid or parent = f.geographiczoneid)\n" +
            "group by zone_name, region_name, region_id) as fac JOIN\n" +
            "\n" +
            "(select region_id, count(district_id) districtcount \n" +
            "FROM vw_districts \n" +
            "group by zone_name, region_name, region_id\n" +
            "order by zone_name, region_name) as dist ON fac.region_id = dist.region_id")
    List<PublicDataRegionsDTO> getPublicDataRegions();


    @Select("select zone_name, region_name, district_name, count(f.id) facilitycount \n" +
            "from vw_districts d join facilities f ON (district_id = f.geographiczoneid or zone_id = f.geographiczoneid or region_id = f.geographiczoneid or parent = f.geographiczoneid) \n" +
            "group by zone_name, region_name, district_name")
    List<PublicDataDistrictsDTO> getPublicDataDistricts();


    @Select("select zone_name, region_name, district_name, f.name as facility_name\n" +
            "from vw_districts d \n" +
            "join facilities f ON (district_id = f.geographiczoneid or zone_id = f.geographiczoneid or region_id = f.geographiczoneid or parent = f.geographiczoneid)\n" +
            "order by zone_name, region_name, district_name, f.name")
    List<PublicDataHealthFacilitiesDTO> getPublicDataHealthFacilities();

    // TO be finalized
    @Select("select 1")
    List<PublicDataProductsDTO> getPublicDataProducts();
}

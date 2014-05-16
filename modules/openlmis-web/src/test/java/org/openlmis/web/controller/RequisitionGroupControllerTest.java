/*
 * This program is part of the OpenLMIS logistics management information system platform software.
 * Copyright © 2013 VillageReach
 *
 *  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more details.
 *  You should have received a copy of the GNU Affero General Public License along with this program.  If not, see http://www.gnu.org/licenses.  For additional information contact info@OpenLMIS.org.
 */

package org.openlmis.web.controller;

import org.junit.Test;
import org.junit.experimental.categories.Category;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.openlmis.core.domain.Pagination;
import org.openlmis.core.domain.RequisitionGroup;
import org.openlmis.core.service.RequisitionGroupService;
import org.openlmis.core.service.StaticReferenceDataService;
import org.openlmis.db.categories.UnitTests;
import org.openlmis.web.response.OpenLmisResponse;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.List;

import static java.util.Arrays.asList;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.openlmis.web.controller.RequisitionGroupController.SEARCH_PAGE_SIZE;
import static org.powermock.api.mockito.PowerMockito.whenNew;

@Category(UnitTests.class)
@RunWith(PowerMockRunner.class)
@PrepareForTest(RequisitionGroupController.class)
public class RequisitionGroupControllerTest {

  @InjectMocks
  private RequisitionGroupController requisitionGroupController;

  @Mock
  private RequisitionGroupService requisitionGroupService;

  @Mock
  private StaticReferenceDataService staticReferenceDataService;

  @Test
  public void shouldSearchRequisitionGroup() throws Exception {
    String searchParam = "searchParam";
    String columnName = "columnName";
    Integer pageNumber = 1;
    Integer pageSize = 10;
    List<RequisitionGroup> requisitionGroups = asList(new RequisitionGroup());

    when(staticReferenceDataService.getPropertyValue(SEARCH_PAGE_SIZE)).thenReturn(String.valueOf(pageSize));
    Pagination pagination = new Pagination(pageNumber, pageSize);
    whenNew(Pagination.class).withArguments(pageNumber, pageSize).thenReturn(pagination);
    when(requisitionGroupService.search(searchParam, columnName, pagination)).thenReturn(requisitionGroups);
    when(requisitionGroupService.getTotalRecords(searchParam, columnName)).thenReturn(5);

    ResponseEntity<OpenLmisResponse> response = requisitionGroupController.search(searchParam, columnName, pageNumber);

    verify(requisitionGroupService).search(searchParam, columnName, pagination);
    verify(staticReferenceDataService).getPropertyValue(SEARCH_PAGE_SIZE);
    assertThat(response.getStatusCode(), is(HttpStatus.OK));
    assertThat((List<RequisitionGroup>) response.getBody().getData().get("requisitionGroupList"), is(requisitionGroups));
    pagination.setTotalRecords(5);
    assertThat((Pagination) response.getBody().getData().get("pagination"), is(pagination));
  }
}

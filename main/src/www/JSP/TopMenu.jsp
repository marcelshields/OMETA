<%--
  ~ Copyright J. Craig Venter Institute, 2013
  ~
  ~ The creation of this program was supported by J. Craig Venter Institute
  ~ and National Institute for Allergy and Infectious Diseases (NIAID),
  ~ Contract number HHSN272200900007C.
  ~
  ~ This program is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: hkim
  Date: 8/30/11
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
  --%>
<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; {$charset|default:'charset=utf-8'}" />
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <title>CEIRS DPCC</title>
  <link rel='stylesheet' id='google-open-sans-css'  href='//fonts.googleapis.com/css?family=Open+Sans%3A400italic%2C700italic%2C300%2C400%2C700' type='text/css' media='screen' />
  <link rel='stylesheet' id='ceirs-bootstrap-stylesheet-css'  href='https://s3.amazonaws.com/ceirs-public/css/bootstrap.css' type='text/css' media='all' />
  <link rel='stylesheet' id='ceirs-font-awesome-stylesheet-css'  href='https://s3.amazonaws.com/ceirs-public/css/font-awesome.css' type='text/css' media='all' />
  <link rel='stylesheet' id='ceirs-smartadmin-production-stylesheet-css'  href='https://s3.amazonaws.com/ceirs-public/css/smartadmin-production.css' type='text/css' media='all' />
  <link rel='stylesheet' id='ceirs-smartadmin-skins-stylesheet-css'  href='https://s3.amazonaws.com/ceirs-public/css/smartadmin-skins.css' type='text/css' media='all' />
  <link rel="stylesheet" href="style/main.css" />
  <link rel="stylesheet" href="style/dataTables.css" />
  <link rel="stylesheet" href="style/tableTools.css" />
  <link rel="stylesheet" href="style/chosen.css" />
  <!-- <link rel="stylesheet" href="style/multiple-select.css" /> -->
  <link rel="stylesheet" href="style/version01.css" />
  <!-- <link rel="stylesheet" href="style/cupertino/jquery-ui-1.8.18.custom.css" /> -->
</head>
<body class="smart-style-2">

  <!-- #HEADER -->
  <header id="header" class="clearfix">

    <div id="logo"> </div>

    <!-- #TOGGLE LAYOUT BUTTONS -->
    <!-- pulled right: nav area -->
    <div class="pull-right">
      
      <!-- collapse menu button -->
      <div id="hide-menu" class="btn-header pull-right">
        <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
      </div>
      <!-- end collapse menu -->

      <!-- logout button -->
      <div id="logout" class="btn-header transparent pull-right authuser">
        <span> <a href="logout.action" title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
      </div>
      <!-- end logout button -->

      <div class="btn-header pull-right authuser">
        <div id="currUserName" style="color:#fff"></div>
      </div>

      <div class="btn-header pull-right noauthuser">
        <a href="addActor.action">Register</a> | <a class="headerLink" href="secureIndex.action">Log in</a>
      </div>

      <div class="btn-header pull-right">
        <a class="headerLink" href="help.action">Help</a>
      </div>

    </div>
    <!-- end pulled right: nav area -->

  </header>
  <!-- END HEADER -->

  <aside id="left-panel">
    <nav>
      <ul>
        <li>
          <a href="#" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Dashboard</span></a>
        </li>
        <li>
          <a href="#"><i class="fa fa-lg fa-fw fa-cloud-upload"></i> <span class="menu-item-parent">Data Submission</span></a>
        </li>
        <li>
          <a href="#"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">Reporting</span><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a>
          <ul>
            <li>
              <a href="#">Data Submission Reports</a>
            </li>
            <li>
              <a href="#">Web Traffic Reports</a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
    <span class="minifyme" data-action="minifyMenu" style=""> <i class="fa fa-arrow-circle-left hit"></i> </span>
  </aside>

  <div id="main" role="main">
    
    <div id="content">

      <h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-cloud-upload"></i> Data Submission <!-- <span>&gt; My Dashboard</span> --></h1>

      <nav id="nav" class="navbar navbar-default">
        <ul class="navbar-nav">
          <li id="project_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="productionStatus.action?projectNames=GSC&iss=true">GSC</a></li>
              <li><a href="productionStatus.action?projectNames=HMP&iss=true">HMP</a></li>
              <li><a href="?p=T1D-CNMC">CNMC</a></li>
              <li><a href="?p=GATES">GATES</a></li>
            </ul>
          </li>
          <li id="cnmc_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">CNMC <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="sampleWithEventLoader.action?label=Family">Register Family</a></li>
              <li><a href="sampleWithEventLoader.action?label=Person">Register Person</a></li>
              <li><a href="sampleWithEventLoader.action?label=Sample">Register Sample</a></li>
              <li><a href="eventLoader.action?label=SR">Sample Receipt</a></li>
              <li><a href="sampleWithEventLoader.action?label=Aliquot">Register Aliquot</a></li>
            </ul>
          </li>
          <li id="gates_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">GATES <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="eventLoader.action?label=PM">Patient Metadata</a></li>
              <li><a href="eventLoader.action?label=HM">Household Metadata</a></li>
              <li><a href="eventLoader.action?label=FM">Family Metadata</a></li>
              <li><a href="eventLoader.action?label=SM">Sample Metadata</a></li>
            </ul>
          </li>
          <li id="admin_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="projectSetup.action">Project Setup</a></li>
              <!--<li><a href="metadataSetup.action?type=p">Project Metadata Setup</a></li>
              <li><a href="metadataSetup.action?type=s">Sample Metadata Setup</a></li>-->
              <li><a href="metadataSetup.action?type=e">Event Metadata Setup</a></li>
              <li><a href="actorRole.action">Actor/Role Management</a></li>
            </ul>
          </li>
          <li id="event_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project Events <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <!--<li><a href="sampleLoader.action">Load Sample</a></li>-->
              <li><a href="eventLoader.action">Load Event</a></li>
            </ul>
          </li>
          <li id="report_li" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Report <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="eventDetail.action">Event Detail</a></li>
              <li><a href="eventReport.action">Event Report</a></li>
            </ul>
          </li>
        </ul>
      </nav>
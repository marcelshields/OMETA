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

<s:include value="TopMenu.jsp" />
  
    <div id="headerDivContainer"></div>
		<h1>Forbidden</h1>
		<div id="middle_content_template">
			<h2>We are sorry, but one or more of the requested resources requires permissions you do not have, even when logged in.</h2>
		</div>
	</div><!-- end #content -->
</div><!-- end #main -->
<s:include value="globalJS.jsp" />
<script src="scripts/jquery/menubar.js"></script>
<script type="text/javascript">
document.body.onload = function () {
  initializeMenubar(<%=request.getRemoteUser()==null%>, "<%=request.getRemoteUser()%>");
};
</script>
</body>
</html>


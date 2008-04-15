<%-- 
    Document   : process.jsp
    Created on : Feb 27, 2008, 9:25:21 AM
    Author     : Kimberly Begley
    Description: JSP file to take user selections from html form.
--%>

<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="sbml.test.sbmlTestselection" %>
<%@ page import="sbml.test.sbmlTestcase" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*"%>

<jsp:useBean id="formHandler" class="sbml.test.FormBean" scope="request">
    <jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>

<%!  
     String[] testtype;
     String[] ctags;
     String[] ttags;
     String[] level;
     
     String testdir;
     String testdir_listing [];
     String test;
     
     
%>

<%
    level = formHandler.getLevels();
    testtype = formHandler.getTesttype();
    ctags = formHandler.getCtags();
    ttags = formHandler.getTtags();

    
    sbmlTestselection t1 = new sbmlTestselection();
    

%>
Selected level is <%=level[0]%> <BR>
Selected testtype is <%=testtype[0]%><BR> 
Component tags to exclude are: 
<%	String c = new String();
  	for(int i=0;i<ctags.length;i++) {
		c = ctags[i];
%>	<%=c%>,
<% } %>
<BR>
Test tags to exclude are: 
<%	String t = new String();
  	for(int i=0;i<ttags.length;i++) {
		t = ttags[i];
%>	<%=t%>,
<% } %>
<BR>


<%  	String testdir = new String();
	    
	ServletContext context = getServletContext();
	InputStream is = context.getResourceAsStream("/WEB-INF/classes/sbml_config_file.txt");
	try{
		BufferedReader d = new BufferedReader(new InputStreamReader(is));
		String line; 
   		if  (   (  line = d.readLine (  )   )  != null  )   {  
     			testdir=line ; 
    		}  
	}
	finally{
		if(is != null) {
			is.close();
		}
	}

	String testdir_listing [];

	// get presence of a header line from the user when they upload maybe?
	int header = 1; 
	// Get directory listings 
	File f = new File(testdir);
	testdir_listing = f.list();
	String tcase = new String(); 
	String tmodelfile = new String();
	Vector<String> selected_cases = new Vector<String>();
	
	for(int i=0;i<testdir_listing.length;i++) {	
  		tcase = testdir_listing[i];
		tmodelfile = t1.getModelFile(tcase,testdir);
		t1.readModelFile(tmodelfile);
		int itsout = 0;
		if(t1.containsTesttype(testtype[0]) && t1.containsLevel(level[0])) {
			
			for(int j=0;j<ctags.length;j++) {
				if(t1.containsComponent(ctags[j])) {
					itsout++;
				}
			}
			for(int k=0;k<ttags.length;k++) {
				if(t1.containsTag(ttags[k])) {
					itsout++;
				}
			}
			if(itsout==0) {
				selected_cases.addElement(tcase);
			}
			

		} // end of if
		
	}
	for(Iterator it = selected_cases.iterator(); it.hasNext();) {
		out.println(it.next() + "<BR>");
	}	

		
%>




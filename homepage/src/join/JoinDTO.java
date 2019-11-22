package join;

public class JoinDTO {
	
	private String		id    	 	;
    private String 		passwd 	 	;
    private String 		jname  		;
    private String 		tel    		;
    private String 		zipcode 	;
    private String 		address1    ;
    private String 		address2    ;
    private String 		job     	;
    private String 		jdate  	 	;
    private String 		fname   	;
	public JoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JoinDTO(String id, String passwd, String jname, String tel, String zipcode, String address1, String address2,
			String job, String jdate, String fname) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.jname = jname;
		this.tel = tel;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.job = job;
		this.jdate = jdate;
		this.fname = fname;
	}

	@Override
	public String toString() {
		return "JoinDTO [id=" + id + ", passwd=" + passwd + ", jname=" + jname + ", tel=" + tel + ", zipcode=" + zipcode
				+ ", address1=" + address1 + ", address2=" + address2 + ", job=" + job + ", jdate=" + jdate + ", fname="
				+ fname + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}

package spring.model.food;

public class MemberDTO {
	
    private String id     	 ;
    private String passwd 	 ;
    private String name   	 ;
    private String tel    	 ;
    private String email   	 ;
    private String zipcode 	 ;
    private String address1  ;
    private String address2  ;
    private String fdate   	 ;
    private String grade  	 ;
    
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String passwd, String name, String tel, String email, String zipcode, String address1,
			String address2, String fdate, String grade) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.fdate = fdate;
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", fdate=" + fdate
				+ ", grade=" + grade + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
    
	
}

package Pack.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

	@Entity
	@Table(name = "`USER`")
	public class User {

		@Id
		@Column(name = "id")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer id;
	
		@Column(name = "username")
		private String username;
	
		@Column(name = "password")
		private String password;
	
		@Column(name = "email")
		private String email;
		
		@Column(name = "fullname")
		private String fullname;
	
		@Column(name = "isAdmin")
		private Boolean isAdmin;
	
		@Column(name = "isActive")
		private Boolean isActive;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
		}

		public Boolean getIsAdmin() {
			return isAdmin;
		}

		public void setIsAdmin(Boolean isAdmin) {
			this.isAdmin = isAdmin;
		}

		public Boolean getIsActive() {
			return isActive;
		}

		public void setIsActive(Boolean isActive) {
			this.isActive = isActive;
		}
		
		
	
		
}
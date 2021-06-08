public class ResponseDTO {
    public class User{
        public String id;
        public String birthDate;
        public String firstName;
        public String lastName;
        public String guid;
        public String zipCode;
        public String city;
        public String state;
        public String district;
        public String email;
        public Integer age;
        public Boolean is_Disabled;
    }
    public User user;
    public static ResponseDTO parse(String json){
        return (ResponseDTO)System.JSON.deserialize(json,ResponseDTO.class);
    }

}
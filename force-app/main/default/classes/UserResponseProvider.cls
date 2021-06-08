public class UserResponseProvider {
    Map<String, Object> reqParams;
    public UserResponseProvider(){
        reqParams= new Map<String , Object>();
        reqParams.put('id','a1234ghjkghjk');
        reqParams.put('birthDate',String.valueOf(Date.newInstance(19, 9,28)));
        reqParams.put('firstName','Pradeep');
        reqParams.put('lastName','Gaikwad');
        Blob b = Crypto.generateAesKey(128);
        System.debug('b '+b.size());
        String str=EncodingUtil.convertToHex(b);
        System.debug('str '+str);
        reqParams.put('guid',str.substring(0, 5));
        reqParams.put('zipCode','431717');
        reqParams.put('city','Degloor');
        reqParams.put('state','Maharashtra');
        reqParams.put('district','Nanded');
        reqParams.put('email','prads@mail.com');
        reqParams.put('age','27');
        reqParams.put('is_Disabled','false');
    }
    public String generateUserReqBody(){
        HttpRequest httpRequest = new HttpRequest();
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeFieldName('user');
        gen.writeStartObject();
        gen.writeStringField('id',String.valueOf((reqParams.get('id'))));
         gen.writeStringField('birthDate', String.valueOf((reqParams.get('birthDate'))));
         gen.writeStringField('firstName', String.valueOf((reqParams.get('firstName'))));
         gen.writeStringField('lastName', String.valueOf((reqParams.get('lastName'))));
         gen.writeStringField('guid', String.valueOf((reqParams.get('guid'))));
         gen.writeStringField('zipCode', String.valueOf((reqParams.get('zipCode'))));
         gen.writeStringField('city', String.valueOf((reqParams.get('city'))));
         gen.writeStringField('state', String.valueOf((reqParams.get('state'))));
         gen.writeStringField('district', String.valueOf((reqParams.get('district'))));
         gen.writeStringField('email', String.valueOf((reqParams.get('email'))));
         gen.writeNumberField('age', Integer.valueOf(reqParams.get('age')));
         gen.writeBooleanField('is_Disabled', Boolean.valueOf(reqParams.get('is_Disabled')));
        gen.writeEndObject();
        gen.writeEndObject();
        String jsonString = gen.getAsString();
        httpRequest.setBody(jsonString);
        return httpRequest.getBody();
    }
    
}
/*
UserResponseProvider obj = new UserResponseProvider();
String response = obj.generateUserReqBody();
System.debug('response '+response);
ResponseDTO dto = ResponseDTO.parse(response);
System.debug('DTO '+dto);*/
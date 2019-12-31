package com.example.vivekprajapati.hoardings_json;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class jsonParser {
    public final static String ip = "192.168.43.226";
    private final static String NAMESPACE = "http://tempuri.org/";
    public final static String URL = "http://" + ip + "/Hoardings/WebService.asmx";
    public final static String BANNER_IMAGE_URL = "http://" + ip + "/Hoardings/Banner_Url_Images/";
    public final static String HOARDING_IMAGE_URL = "http://" + ip + "/Hoardings/Hoarding_Image/";
    private final static String SOAP_ACTION = "http://tempuri.org/";
    public static String responseJson = "";

    public static String invokeJSON(String methodName) {
        // Create request
        SoapObject request = new SoapObject(NAMESPACE, methodName);
        // Create envelope
        SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
                SoapEnvelope.VER11);
        envelope.dotNet = true;
        // Set output SOAP object
        envelope.setOutputSoapObject(request);
        // Create HTTP call object
        HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);
        try {
            // Invole web service
            androidHttpTransport.call(SOAP_ACTION + methodName, envelope);
            // Get the response
            SoapPrimitive response = (SoapPrimitive) envelope.getResponse();
            // Assign it to static variable
            responseJson = response.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseJson;
    }

    public static String invokeJSON(String methodName, String varname,
                                    String valuename) {
        // Create request
        SoapObject request = new SoapObject(NAMESPACE, methodName);
        // Create envelope
        SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
                SoapEnvelope.VER11);
        envelope.dotNet = true;
        PropertyInfo info = new PropertyInfo();
        info.setName(varname);
        info.setValue(valuename);
        info.setType(String.class);
        request.addProperty(info);
        // Set output SOAP object
        envelope.setOutputSoapObject(request);
        // Create HTTP call object
        HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);
        try {
            // Invole web service
            androidHttpTransport.call(SOAP_ACTION + methodName, envelope);
            // Get the response
            SoapPrimitive response = (SoapPrimitive) envelope.getResponse();
            // Assign it to static variable
            responseJson = response.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseJson;
    }

}

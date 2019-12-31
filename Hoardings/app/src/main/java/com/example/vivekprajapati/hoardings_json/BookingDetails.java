package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;


public class BookingDetails extends AppCompatActivity {

    ListView lvBookingDetails;

    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    public static final String TAG = "Booking_Details"; // table name
    public static final String TAG_DETAILS_ID = "Details_Id"; // this variables are = to no of fields in tables
    public static final String TAG_BOOKING_ID = "Booking_Id"; // value = variable name in mozilla
    public static final String TAG_HOARDING_ID = "Hoarding_Id"; // value = variable name in mozilla
    public static final String TAG_BANNER_URL = "Banner_Url"; // this variables are = to no of fields in tables
    public static final String TAG_HOARDING_PRICE = "Hoarding_Price"; // value = variable name in mozilla
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_booking_details);
        lvBookingDetails = (ListView) findViewById(R.id.lvBookingDetails);
        new getBooking_Details().execute();
    }

    class getBooking_Details extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(BookingDetails.this);
            progressDialog.setMessage("Please Wait, Booking's Detail are been loading");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getBooking_Details", "Booking_id", getIntent().getStringExtra(BookingActivity.TAG_BOOKING_ID));
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_DETAILS_ID, jsonObject1.getString(TAG_DETAILS_ID)); // change name
                    hashMap.put(TAG_BOOKING_ID, jsonObject1.getString(TAG_BOOKING_ID));
                    hashMap.put(TAG_HOARDING_ID, jsonObject1.getString(TAG_HOARDING_ID)); // change name
                    hashMap.put(TAG_BANNER_URL, jsonObject1.getString(TAG_BANNER_URL));
                    hashMap.put(TAG_HOARDING_PRICE, jsonObject1.getString(TAG_HOARDING_PRICE));
                    arrayList.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            BookingDetailsAdapter bookingDetailsAdapter = new BookingDetailsAdapter(BookingDetails.this, arrayList);
            lvBookingDetails.setAdapter(bookingDetailsAdapter);
            progressDialog.dismiss();
        }

    }
}

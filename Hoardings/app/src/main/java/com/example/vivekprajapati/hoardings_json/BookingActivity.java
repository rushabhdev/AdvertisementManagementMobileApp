package com.example.vivekprajapati.hoardings_json;

import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;


/**
 * Created by Vivek Prajapati on 03/02/2017.
 */

public class BookingActivity extends AppCompatActivity {
    ListView lvBooking;
    ProgressDialog progressDialog;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    public static final String TAG = "Booking"; // table name
    public static final String TAG_BOOKING_ID = "Booking_Id"; // this variables are = to no of fields in tables
    public static final String TAG_BOOKING_DATE = "Booking_Date"; // value = variable name in mozilla
    public static final String TAG_BOOKING_DESC = "Booking_Desc"; // this variables are = to no of fields in tables
    public static final String TAG_BOOKING_STARTDATE = "Booking_StartDate"; // value = variable name in mozilla
    public static final String TAG_BOOKING_ENDDATE = "Booking_EndDate"; // value = variable name in mozilla
    public static final String TAG_USER_ID = "User_Id"; // this variables are = to no of fields in tables
    public static final String TAG_COUPON_ID = "Coupon_Id"; // value = variable name in mozilla
    public static final String TAG_BOOKING_STATUS = "Booking_Status"; // value = variable name in mozilla

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_booking);
        lvBooking = (ListView) findViewById(R.id.lvBooking);
        new getBooking().execute();
    }

    class getBooking extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(BookingActivity.this);
            progressDialog.setMessage("Please Cooperate, Booking data is loading");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getBooking", "User_Id", getSharedPreferences("MyFile", 0).getString(LoginActivity.TAG_USER_ID, ""));
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_BOOKING_ID, jsonObject1.getString(TAG_BOOKING_ID)); // change name
                    hashMap.put(TAG_BOOKING_DATE, jsonObject1.getString(TAG_BOOKING_DATE));
                    hashMap.put(TAG_BOOKING_DESC, jsonObject1.getString(TAG_BOOKING_DESC));
                    hashMap.put(TAG_BOOKING_STARTDATE, jsonObject1.getString(TAG_BOOKING_STARTDATE));
                    hashMap.put(TAG_BOOKING_ENDDATE, jsonObject1.getString(TAG_BOOKING_ENDDATE));
                    hashMap.put(TAG_USER_ID, jsonObject1.getString(TAG_USER_ID));
                    hashMap.put(TAG_COUPON_ID, jsonObject1.getString(TAG_COUPON_ID));
                    hashMap.put(TAG_BOOKING_STATUS, jsonObject1.getString(TAG_BOOKING_STATUS));
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
            BookingAdapter bookingAdapter = new BookingAdapter(BookingActivity.this, arrayList);
            lvBooking.setAdapter(bookingAdapter);
            lvBooking.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
                    Intent i = new Intent(BookingActivity.this, BookingDetails.class);
                    i.putExtra(TAG_BOOKING_ID, arrayList.get(position).get(TAG_BOOKING_ID));
                    startActivity(i);
                }
            });
            progressDialog.dismiss();
        }
    }
}
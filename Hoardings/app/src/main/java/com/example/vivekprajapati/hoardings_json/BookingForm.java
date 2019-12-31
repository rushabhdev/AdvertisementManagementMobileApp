package com.example.vivekprajapati.hoardings_json;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.DatePicker;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class BookingForm extends AppCompatActivity implements View.OnClickListener {
    EditText etBookingDesc, etBookingStartDate, etBookingEndDate, etCouponCode;
    Button btnbookhoard, btnApply;
    String coupon_id;
    ProgressDialog progressDialog;
    private SharedPreferences s1;
    public static String TAG = "Cart";
    public static String TAG_CART_ID = "Cart_Id";
    public static String TAG_User_ID = "User_Id";
    public static String TAG_Hoarding_ID = "Hoarding_Id";
    public static String TAG_Hoarding_Price = "Hoarding_Price";
    public static String TAG_Coupon_Code = "Coupon_Code";
    public static String TAG_Banner_Url = "Banner_Url";
    ArrayList<HashMap<String, String>> cartlist = new ArrayList<HashMap<String, String>>();
    ListView lvCart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_booking_form);
        initialize();
    }

    void initialize() {
        lvCart = (ListView) findViewById(R.id.lvCart);
        s1 = getSharedPreferences("MyFile", 0);
        etBookingDesc = (EditText) findViewById(R.id.etBookingDesc);
        etBookingStartDate = (EditText) findViewById(R.id.etBookingStartdate);
        etBookingStartDate.setFocusableInTouchMode(false);
        etBookingStartDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setDatePicker(etBookingStartDate);
            }
        });
        etBookingEndDate = (EditText) findViewById(R.id.etBookingEndDate);
        etBookingEndDate.setFocusableInTouchMode(false);
        etBookingEndDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setDatePicker(etBookingEndDate);
            }
        });
        etCouponCode = (EditText) findViewById(R.id.etCouponCode);
        btnbookhoard = (Button) findViewById(R.id.btnbookhoard);
        btnbookhoard.setOnClickListener(this);
        btnApply = (Button) findViewById(R.id.btnApplyCoupon);
        btnApply.setOnClickListener(this);
        new getCart().execute();
    }


    class getCart extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(BookingForm.this);
            progressDialog.setMessage("Loading Your Cart Please Wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getCart", "User_Id", s1.getString(LoginActivity.TAG_USER_ID, ""));
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_Hoarding_ID, jsonObject1.getString(TAG_Hoarding_ID));
                    hashMap.put(TAG_Hoarding_Price, jsonObject1.getString(TAG_Hoarding_Price));
                    hashMap.put(TAG_Banner_Url, jsonObject1.getString(TAG_Banner_Url));
                    hashMap.put(TAG_CART_ID, jsonObject1.getString(TAG_CART_ID));
                    hashMap.put(TAG_User_ID, jsonObject1.getString(TAG_User_ID));
                    cartlist.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            CartAdapter cartAdapter = new CartAdapter(BookingForm.this, cartlist);
            lvCart.setAdapter(cartAdapter);
            setListViewHeightBasedOnItems(lvCart);
            progressDialog.dismiss();
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnbookhoard:
                new placeBooking().execute();
                break;
            case R.id.btnApplyCoupon:
                new checkCoupon().execute();
                break;
        }
    }

    private void setDatePicker(final EditText et) {
        final SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd-yyyy");
        Calendar newCalendar = Calendar.getInstance();
        DatePickerDialog fromDatePickerDialog = new DatePickerDialog(this,
                new DatePickerDialog.OnDateSetListener() {

                    @Override
                    public void onDateSet(DatePicker view, int year,
                                          int monthOfYear, int dayOfMonth) {
                        // TODO Auto-generated method stub
                        Calendar newDate = Calendar.getInstance();
                        newDate.set(year, monthOfYear, dayOfMonth);
                        et.setText(dateFormatter.format(newDate.getTime()));
                    }
                }, newCalendar.get(Calendar.YEAR),
                newCalendar.get(Calendar.MONTH),
                newCalendar.get(Calendar.DAY_OF_MONTH));
        fromDatePickerDialog.show();
    }

    class placeBooking extends AsyncTask<Void, Void, Void> {
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(BookingForm.this);
            progressDialog.setMessage("Your Booking is getting placed...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {

            String json = jsonParser.invokeJSON("setBooking", "user_id", etBookingDesc.getText().toString() + "," + etBookingStartDate.getText().toString() + "," + etBookingEndDate.getText().toString() + "," + s1.getString(LoginActivity.TAG_USER_ID, "") + "," + coupon_id);
            try {
                JSONObject jsonObject = new JSONObject(json);
                result = jsonObject.getString("Result");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            Toast.makeText(BookingForm.this, etBookingDesc.getText().toString() + "," + etBookingStartDate.getText().toString() + "," + etBookingEndDate.getText().toString() + "," + s1.getString(LoginActivity.TAG_USER_ID, "") + "," + etCouponCode.getText().toString(), Toast.LENGTH_SHORT).show();
            if (result.equals("1")) {
                SharedPreferences.Editor e = getSharedPreferences("MyFile", 0).edit();
                e.remove("hoardings");
                e.commit();
                Toast.makeText(BookingForm.this, "Booking Done Successfully", Toast.LENGTH_SHORT).show();
                Intent i = new Intent(BookingForm.this, HomeActivity.class);
                startActivity(i);
            } else {
                Toast.makeText(BookingForm.this, "Error", Toast.LENGTH_SHORT).show();
            }
            progressDialog.dismiss();
        }
    }

    public static boolean setListViewHeightBasedOnItems(ListView listView) {

        ListAdapter listAdapter = listView.getAdapter();
        if (listAdapter != null) {

            int numberOfItems = listAdapter.getCount();

            // Get total height of all items.
            int totalItemsHeight = 0;
            for (int itemPos = 0; itemPos < numberOfItems; itemPos++) {
                View item = listAdapter.getView(itemPos, null, listView);
                item.measure(0, 0);
                totalItemsHeight += item.getMeasuredHeight();
            }

            // Get total height of all item dividers.
            int totalDividersHeight = listView.getDividerHeight() *
                    (numberOfItems - 1);

            // Set list height.
            ViewGroup.LayoutParams params = listView.getLayoutParams();
            params.height = totalItemsHeight + totalDividersHeight;
            listView.setLayoutParams(params);
            listView.requestLayout();

            return true;

        } else {
            return false;
        }
    }

    class checkCoupon extends AsyncTask<Void, Void, Void> {
        JSONObject jsonObject;

        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(BookingForm.this);
            progressDialog.setMessage("Validating Coupon, please wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("checkCoupon", "Coupon_Code", etCouponCode.getText().toString());
            try {
                JSONObject jsonObject = new JSONObject(json);
                result = jsonObject.getString("Result");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            if (result.equals("0")) {
                Toast.makeText(BookingForm.this, "Coupon is invalid or it is expired", Toast.LENGTH_SHORT).show();
            } else {
                coupon_id = result;
                Toast.makeText(BookingForm.this, "Coupon is valid, You can proceed to book hoarding", Toast.LENGTH_SHORT).show();
            }
            progressDialog.dismiss();
        }
    }
}

package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class ViewCart extends AppCompatActivity implements View.OnClickListener {

    public static String TAG = "Cart";
    public static String TAG_CART_ID = "Cart_Id";
    public static String TAG_User_ID = "User_Id";
    public static String TAG_Hoarding_ID = "Hoarding_Id";
    public static String TAG_Hoarding_Price = "Hoarding_Price";
    public static String TAG_Banner_Url = "Banner_Url";
    SharedPreferences s1;

    ArrayList<HashMap<String, String>> cartlist = new ArrayList<HashMap<String, String>>();
    ProgressDialog progressDialog;
    Button btnPlaceBooking;
    ListView lvCart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_view_cart);
        btnPlaceBooking = (Button) findViewById(R.id.btnPlaceBooking);
        btnPlaceBooking.setOnClickListener(this);
        s1 = getSharedPreferences("MyFile", 0);
        lvCart = (ListView) findViewById(R.id.lvCart);
        new getCart().execute();
    }

    class getCart extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(ViewCart.this);
            progressDialog.setMessage("Loading Please wait...");
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
            CartAdapter cartAdapter = new CartAdapter(ViewCart.this, cartlist);
            lvCart.setAdapter(cartAdapter);
            progressDialog.dismiss();
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btnPlaceBooking:
                startActivity(new Intent(ViewCart.this, BookingForm.class));
                break;
        }
    }


}

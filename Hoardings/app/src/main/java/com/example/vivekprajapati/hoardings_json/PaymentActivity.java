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

public class PaymentActivity extends AppCompatActivity {

    ListView lvPayment;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    public static final String TAG = "Payment";
    public static final String TAG_PAYMENT_ID = "Payment_Id";
    public static final String TAG_PAYMENT_DATE = "Payment_Date";
    public static final String TAG_PAYMENT_AMOUNT = "Payment_Amount";
    public static final String TAG_BOOKING_ID = "Booking_Id";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_payment);
        lvPayment = (ListView) findViewById(R.id.lvPayment);
        new getPayment().execute();
    }

    class getPayment extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(PaymentActivity.this);
            progressDialog.setMessage("Please Wait Payments are Loading...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getPayment", "User_Id", getSharedPreferences("MyFile", 0).getString(LoginActivity.TAG_USER_ID, "")); // this will let android studio know that it needs to fetch data from getPayment Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_PAYMENT_ID, jsonObject1.getString(TAG_PAYMENT_ID)); // change name
                    hashMap.put(TAG_PAYMENT_DATE, jsonObject1.getString(TAG_PAYMENT_DATE));
                    hashMap.put(TAG_PAYMENT_AMOUNT, jsonObject1.getString(TAG_PAYMENT_AMOUNT)); // change name
                    hashMap.put(TAG_BOOKING_ID, jsonObject1.getString(TAG_BOOKING_ID));
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
            PaymentAdapter paymentAdapter = new PaymentAdapter(PaymentActivity.this, arrayList);
            lvPayment.setAdapter(paymentAdapter);
            progressDialog.dismiss();
        }
    }
}

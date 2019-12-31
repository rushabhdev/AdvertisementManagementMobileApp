package com.example.vivekprajapati.hoardings_json;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;


public class CartAdapter extends BaseAdapter {

    Activity a;

    ArrayList<HashMap<String, String>> arrayList;
    LayoutInflater inflater;
    private ProgressDialog progressDialog;

    public CartAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList) {
        this.a = a;
        this.arrayList = arrayList;
        inflater = a.getLayoutInflater();
    }

    @Override
    public int getCount() {
        return arrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return arrayList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = inflater.inflate(R.layout.row_cart, null);
        }
        //User_Id,Hoarding_Name,Hoarding_Address remove and add image
        ImageView imageView = (ImageView) convertView.findViewById(R.id.ivBannerImage);
        TextView tvHoardingId = (TextView) convertView.findViewById(R.id.tvHoardingId);
        TextView tvHoardingPrice = (TextView) convertView.findViewById(R.id.tvHoardingPrice);
        final HashMap<String, String> hashMap = arrayList.get(position);
        ImageView imageView1 = (ImageView) convertView.findViewById(R.id.ivDelete);
        imageView1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new deleteCart().execute("Delete from Cart where Cart_Id=" + hashMap.get(ViewCart.TAG_CART_ID));
            }
        });
        Picasso.with(a).load(jsonParser.BANNER_IMAGE_URL + hashMap.get(ViewCart.TAG_Banner_Url).replace(" ", "%20")).into(imageView);
        tvHoardingId.setText(hashMap.get(ViewCart.TAG_Hoarding_ID));
        tvHoardingPrice.setText(hashMap.get(ViewCart.TAG_Hoarding_Price));
        return convertView;
    }

    class deleteCart extends AsyncTask<String, Void, Void> {
        JSONObject jsonObject;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(a);
            progressDialog.setMessage("Logging in Please Wait");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(String... params) {
            String json = jsonParser.invokeJSON("setdata", "query", params[0]);
            try {
                jsonObject = new JSONObject(json);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            try {
                if (jsonObject.getString("Result").equals("1")) { //THIS BLOCK IS FOR SETTINNG PARAMETERS FOR WHICH USER IS LOGGED IN.
                    Toast.makeText(a, "Hoarding removed from the cart", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(a, "Invalid login details", Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            progressDialog.dismiss();
        }
    }
}
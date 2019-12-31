package com.example.vivekprajapati.hoardings_json;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Vivek Prajapati on 06/02/2017.
 */

public class BookingDetailsAdapter extends BaseAdapter {
    Activity a;
    ArrayList<HashMap<String, String>> arrayList;
    LayoutInflater layoutInflater;

    BookingDetailsAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList) {
        this.a = a;
        this.arrayList = arrayList;
        layoutInflater = a.getLayoutInflater();
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
            convertView = layoutInflater.inflate(R.layout.row_cart, null);
        }

        ImageView imageView = (ImageView) convertView.findViewById(R.id.ivBannerImage);
        TextView tvHoardingId = (TextView) convertView.findViewById(R.id.tvHoardingId);
        TextView tvHoardingPrice = (TextView) convertView.findViewById(R.id.tvHoardingPrice);
        HashMap<String, String> hashMap = arrayList.get(position);
        Picasso.with(a).load(jsonParser.BANNER_IMAGE_URL + hashMap.get(BookingDetails.TAG_BANNER_URL).replace(" ", "%20")).into(imageView);
        tvHoardingId.setText(hashMap.get(BookingDetails.TAG_HOARDING_ID));
        tvHoardingPrice.setText(hashMap.get(BookingDetails.TAG_HOARDING_PRICE));
        return convertView;
    }
}

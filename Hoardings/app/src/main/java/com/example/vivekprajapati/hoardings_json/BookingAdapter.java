package com.example.vivekprajapati.hoardings_json;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.app.Activity;
import android.view.LayoutInflater;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Vivek Prajapati on 03/02/2017.
 */

public class BookingAdapter extends BaseAdapter {
    Activity a;
    ArrayList<HashMap<String, String>> arrayList;
    LayoutInflater inflater;

    BookingAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList) {
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
            convertView = inflater.inflate(R.layout.row_booking, null);
        }

        TextView tvBookingDate = (TextView) convertView.findViewById(R.id.tvBookingDate);
        TextView tvBookingDesc = (TextView) convertView.findViewById(R.id.tvBookingDesc);
        TextView tvBookingStartDate = (TextView) convertView.findViewById(R.id.tvBookingStartDate);
        TextView tvBookingNo = (TextView) convertView.findViewById(R.id.tvBookingNo);
        TextView tvCouponId = (TextView) convertView.findViewById(R.id.tvCouponId);
        TextView tvBookingStatus = (TextView) convertView.findViewById(R.id.tvBookingStatus);

        HashMap<String, String> hashMap = arrayList.get(position);

        tvBookingDate.setText("Booking Date :" + hashMap.get(BookingActivity.TAG_BOOKING_DATE));
        tvBookingDesc.setText("Remarks :" + hashMap.get(BookingActivity.TAG_BOOKING_DESC));
        tvBookingStartDate.setText("Booking Duration :" + hashMap.get(BookingActivity.TAG_BOOKING_STARTDATE) + " - " + hashMap.get(BookingActivity.TAG_BOOKING_ENDDATE));
        tvBookingNo.setText("Booking No :" + hashMap.get(BookingActivity.TAG_BOOKING_ID));
        tvCouponId.setText("Coupon :" + hashMap.get(BookingActivity.TAG_COUPON_ID));
        tvBookingStatus.setText("Status :" + hashMap.get(BookingActivity.TAG_BOOKING_STATUS));
        return convertView;
    }
}

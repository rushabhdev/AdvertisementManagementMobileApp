package com.example.vivekprajapati.hoardings_json;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Vivek Prajapati on 13/02/2017.
 */

public class PaymentAdapter extends BaseAdapter {

    Activity a;
    ArrayList<HashMap<String, String>> arrayList=new ArrayList<>();;
    LayoutInflater layoutInflater;

    PaymentAdapter(Activity a, ArrayList<HashMap<String, String>> arrayList){
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
        if(convertView==null){
            convertView=layoutInflater.inflate(R.layout.row_payment,null);
        }
        TextView tvPaymentDate = (TextView) convertView.findViewById(R.id.tvPaymentDate);
        TextView tvPaymentAmount = (TextView) convertView.findViewById(R.id.tvPaymentAmount);
        TextView tvBookingId = (TextView) convertView.findViewById(R.id.tvBookingId);


        HashMap<String, String> hashMap = arrayList.get(position);

        tvPaymentDate.setText("Payment Date :" + hashMap.get(PaymentActivity.TAG_PAYMENT_DATE));
        tvPaymentAmount.setText("Payment Amount :" + hashMap.get(PaymentActivity.TAG_PAYMENT_AMOUNT));
        tvBookingId.setText("Booking Id :" + hashMap.get(PaymentActivity.TAG_BOOKING_ID));
        // tvBookingDate.setText("Booking Date:" + hashMap.get(BookingActivity.TAG_BOOKING_DATE));111
        return convertView;
    }
}

package com.example.vivekprajapati.hoardings_json;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ScrollView;
import android.widget.TextView;

public class ContactUs extends AppCompatActivity {
    TextView tvaboutustitle,tvaddress,tvcontactahd,tvcontactvad,tvcontactsurat,tvcontactrajkot,tvcontactnos;
    TextView tvcontactno1,tvcontactno2,tvcontactemail,tvcontactemailid1,tvcontactemailid2,tvwebsitetitle,tvwebsite;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_contact_us);

    }
    void initialise(){
        tvaboutustitle=(TextView)findViewById(R.id.tvaboutustitle);
        tvaddress=(TextView)findViewById(R.id.tvaddress);
        tvcontactahd=(TextView)findViewById(R.id.tvcontactahd);
        tvcontactvad=(TextView)findViewById(R.id.tvcontactvad);
        tvcontactsurat=(TextView)findViewById(R.id.tvcontactsurat);
        tvcontactrajkot=(TextView)findViewById(R.id.tvcontactrajkot);
        tvcontactnos=(TextView)findViewById(R.id.tvcontactnos);
        tvcontactno1=(TextView)findViewById(R.id.tvcontactno1);
        tvcontactno2=(TextView)findViewById(R.id.tvcontactno2);
        tvcontactemail=(TextView)findViewById(R.id.tvcontactemail);
        tvcontactemailid1=(TextView)findViewById(R.id.tvcontactemailid1);
        tvcontactemailid2=(TextView)findViewById(R.id.tvcontactemailid2);
        tvwebsitetitle=(TextView)findViewById(R.id.tvwebsitetitle);
        tvwebsite=(TextView)findViewById(R.id.tvwebsite);
    }
}

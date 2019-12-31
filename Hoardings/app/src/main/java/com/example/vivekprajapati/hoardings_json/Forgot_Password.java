package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class Forgot_Password extends AppCompatActivity implements View.OnClickListener {

    EditText etforgotpassword;
    Button btnforgotpassword;
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_forgot__password);
        etforgotpassword=(EditText)findViewById(R.id.etforgotpassword);
        btnforgotpassword=(Button)findViewById(R.id.btnforgotpassword);
        btnforgotpassword.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch(v.getId()){
            case R.id.btnforgotpassword:
                new ForgotPassword().execute();
                break;
        }
    }

    class ForgotPassword extends AsyncTask<Void, Void, Void>{
        JSONObject jsonObject;
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(Forgot_Password.this);
            progressDialog.setMessage("Retrieving Info, Please Wait");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("forgotpassword", "query", "Select * from [User] where User_Email = '" + etforgotpassword.getText().toString() + "'");
            try {
                jsonObject = new JSONObject(json);
                result = jsonObject.getString("Result");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            if (result.equals("1")) {
                    Toast.makeText(Forgot_Password.this, "Login details are sent to your E-mail, Please Login Now", Toast.LENGTH_SHORT).show();
                    Intent i = new Intent(Forgot_Password.this, LoginActivity.class);
                    startActivity(i);
            }  else {
                    Toast.makeText(Forgot_Password.this, "The E-mail you entered was not found", Toast.LENGTH_SHORT).show();
            }
            progressDialog.dismiss();
        }
    }
}

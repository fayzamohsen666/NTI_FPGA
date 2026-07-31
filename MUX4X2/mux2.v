module mux2(  
  input D0, D1, s,
  output Y 
);

  assign Y= (D0 & (~s)) | (D1 & s);

endmodule
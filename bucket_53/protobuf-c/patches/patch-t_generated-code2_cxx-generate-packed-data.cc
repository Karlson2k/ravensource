--- t/generated-code2/cxx-generate-packed-data.cc.orig	2018-08-14 04:00:07 UTC
+++ t/generated-code2/cxx-generate-packed-data.cc
@@ -998,7 +998,7 @@ static void dump_test_packed_repeated_en
 static void dump_test_unknown_fields (void)
 {
   EmptyMess mess;
-  const google::protobuf::Message::Reflection *reflection = mess.GetReflection();
+  const google::protobuf::Reflection *reflection = mess.GetReflection();
   google::protobuf::UnknownFieldSet *fs = reflection->MutableUnknownFields(&mess);
 
 #if GOOGLE_PROTOBUF_VERSION >= 2001000

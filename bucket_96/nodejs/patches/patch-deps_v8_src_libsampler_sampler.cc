--- deps/v8/src/libsampler/sampler.cc.orig	2022-07-06 19:06:47 UTC
+++ deps/v8/src/libsampler/sampler.cc
@@ -484,7 +484,7 @@ void SignalHandler::FillRegisterState(vo
   state->fp =
       reinterpret_cast<void*>(arm_thread_state64_get_fp(mcontext->__ss));
 #endif  // V8_HOST_ARCH_*
-#elif V8_OS_FREEBSD
+#elif V8_OS_FREEBSD || V8_OS_DRAGONFLYBSD
 #if V8_HOST_ARCH_IA32
   state->pc = reinterpret_cast<void*>(mcontext.mc_eip);
   state->sp = reinterpret_cast<void*>(mcontext.mc_esp);

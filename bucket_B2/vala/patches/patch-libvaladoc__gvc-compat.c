From 933eb2d0e41bb7fdc4fe5fc01a03254965990f3e Mon Sep 17 00:00:00 2001
From: Sudhanshu Tiwari <sdansht@gmail.com>
Date: Thu, 15 Feb 2024 15:39:14 +0530
Subject: [PATCH] libvaladoc: Fix build with graphviz >= 10.0.1

Replaced TRUE with 1

Fixes https://gitlab.gnome.org/GNOME/vala/issues/1524
---
 libvaladoc/gvc-compat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- libvaladoc/gvc-compat.c.orig
+++ libvaladoc/gvc-compat.c
@@ -48,7 +48,7 @@ Agnode_t*
 valadoc_compat_gvc_graph_create_node (Agraph_t* graph, const char *name)
 {
 #ifdef WITH_CGRAPH
-	return agnode (graph, (char*) name, TRUE);
+	return agnode (graph, (char*) name, 1 /*TRUE*/);
 #else
 	return agnode (graph, (char*) name);
 #endif
@@ -68,7 +68,7 @@ Agedge_t*
 valadoc_compat_gvc_graph_create_edge (Agraph_t* graph, Agnode_t* from, Agnode_t* to)
 {
 #ifdef WITH_CGRAPH
-	return agedge (graph, from, to, NULL, TRUE);
+	return agedge (graph, from, to, NULL, 1 /*TRUE*/);
 #else
 	return agedge (graph, from, to);
 #endif
-- 
GitLab


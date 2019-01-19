#pragma once

bool openImage(const char* img);
bool makeExe(int entry);
bool replaceRsrc(int type, int id, int land, void* data, int data_sz);
void closeImage();

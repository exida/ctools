int main(void) {
  int i=-4;  
/*ERROR_LINE*/  if (i < 0) { // Invert numbers only if needed \
    i *= -1;
  }
  return i;
}

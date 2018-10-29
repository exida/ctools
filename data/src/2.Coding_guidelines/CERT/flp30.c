int main(void)
{
  int i=0;
  for (float x = 0.1f; x <= 1.0f; x += 0.1f) /* ERROR_LINE */
  {
    ++i;
  }
  return i;
}


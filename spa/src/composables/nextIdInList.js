const nextIdInList = (list, value) => {
  const currentValueIndex = list.indexOf(value);
  //  This was supposed to get an error, but passed for some reasons
  //  const nextValueIndex = (currentActionIndex + 1) % list.length;
  const nextValueIndex = (currentValueIndex + 1) % list.length;
  const nextValue = list[nextValueIndex];
  return nextValue;
};

export default nextIdInList;

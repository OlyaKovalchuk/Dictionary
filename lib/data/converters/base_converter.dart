abstract class BaseConverter<IN, OUT> {
  OUT inToOut(IN inObject) => processConvertInToOut(inObject);

  OUT? inToOutOrNull(IN? inObject) =>
      inObject == null ? null : processConvertInToOut(inObject);

  IN outToIn(OUT outObject) => processConvertOutToIn(outObject);

  IN? outToInOrNull(OUT? outObject) =>
      outObject == null ? null : processConvertOutToIn(outObject);

  List<OUT> listInToOut(List<IN> inObjects) => inObjects.map(inToOut).toList();

  List<OUT>? listInToOutOrNull(List<IN?>? inObjects) =>
      inObjects?.map(inToOutOrNull).whereType<OUT>().toList();

  List<IN> listOutToIn(List<OUT> outObjects) =>
      outObjects.map(outToIn).toList();

  List<IN>? listOutToInOrNull(List<OUT?>? outObjects) =>
      outObjects?.map(outToInOrNull).whereType<IN>().toList();

  OUT processConvertInToOut(IN inObject);

  IN processConvertOutToIn(OUT outObject);
}

export const clamp = (value, min, max) => Math.min(max, Math.max(min, value));

export const getBaseTime = (videoTime, offset) => Math.max(0, videoTime - offset);

export const getVideoTime = (baseTime, offset, videoDuration) => {
  const unclamped = baseTime + offset;
  const hasDuration = Number.isFinite(videoDuration);
  return clamp(unclamped, 0, hasDuration ? videoDuration : unclamped);
};

export const getTimelineDuration = (durations, offsets) => Math.max(
  0,
  Math.max(0, (durations.video1 || 0) - offsets.video1),
  Math.max(0, (durations.video2 || 0) - offsets.video2),
);

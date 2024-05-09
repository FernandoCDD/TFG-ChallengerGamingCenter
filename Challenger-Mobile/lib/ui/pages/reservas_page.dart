import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';

class ReservasPage extends StatefulWidget {
  const ReservasPage({super.key});

  @override
  State<ReservasPage> createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  final now = DateTime.now();
  late BookingService mockBockingService;

  @override
  void initState() {
    super.initState();
    // mockBockingService = BookingService(
    //   bookingStart: bookingStart,
    //   bookingEnd: bookingEnd,
    //   serviceName: 'Reserva',
    //   serviceDuration: serviceDuration)
  }

  @override
  Widget build(BuildContext context) {
    return const Text("En proceso");
    //     BookingCalendar(
    //     key: key,
    //     ///These are the required parameters
    //     getBookingStream: getBookingStream,
    //     uploadBooking: uploadBooking,
    //     convertStreamResultToDateTimeRanges: convertStreamResultToDateTimeRanges,
    //     ///These are only customizable, optional parameters
    //     bookingButtonColor: bookingButtonColor,
    //     bookingButtonText: bookingButtonText,
    //     bookingExplanation: bookingExplanation,
    //     bookingGridChildAspectRatio: bookingGridChildAspectRatio,
    //     bookingGridCrossAxisCount: bookingGridCrossAxisCount,
    //     formatDateTime: formatDateTime,
    //     convertStreamResultToDateTimeRanges:
    //     convertStreamResultToDateTimeRanges,
    //     availableSlotColor: availableSlotColor,
    //     availableSlotText: availableSlotText,
    //     bookedSlotColor: bookedSlotColor,
    //     bookedSlotText: bookedSlotText,
    //     selectedSlotColor: selectedSlotColor,
    //     selectedSlotText: selectedSlotText,
    //     gridScrollPhysics: gridScrollPhysics,
    //     loadingWidget: loadingWidget,
    //     errorWidget: errorWidget,
    //     uploadingWidget: uploadingWidget,
    //     pauseSlotColor: pauseSlotColor,
    //     pauseSlotText: pauseSlotText,
    //     hideBreakTime: hideBreakTime,
    //     locale: locale,
    //     disabledDays: disabledDays,
    //     startingDayOfWeek: startingDayOfWeek,
  }
}

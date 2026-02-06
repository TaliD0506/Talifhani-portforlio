<?php
require_once __DIR__ . '/admin_auth.php';
require_once __DIR__ . '/header.php';

// Check if payment_status column exists in bookings table
$check_column = $mysqli->query("SHOW COLUMNS FROM `bookings` LIKE 'payment_status'");
$payment_status_exists = $check_column->num_rows > 0;

// Get pending rental payments statistics (with fallback if column doesn't exist)
if ($payment_status_exists) {
    $pending_bookings = $mysqli->query("SELECT COUNT(*) as count FROM bookings WHERE payment_status = 'pending'")->fetch_assoc()['count'];
    $paid_bookings = $mysqli->query("SELECT COUNT(*) as count FROM bookings WHERE payment_status = 'paid'")->fetch_assoc()['count'];
    
    // Calculate pending revenue
    $pending_revenue_result = $mysqli->query("SELECT COALESCE(SUM(total_amount), 0) as total FROM bookings WHERE payment_status = 'pending'");
    $pending_revenue = $pending_revenue_result->fetch_assoc()['total'];
    
    // Calculate total revenue (both pending and paid)
    $total_revenue_result = $mysqli->query("SELECT COALESCE(SUM(total_amount), 0) as total FROM bookings");
    $total_revenue = $total_revenue_result->fetch_assoc()['total'];
    
    // Calculate monthly revenue for the chart (last 12 months)
    $monthly_revenue_query = "
        SELECT 
            DATE_FORMAT(created_at, '%Y-%m') as month,
            COALESCE(SUM(total_amount), 0) as revenue
        FROM bookings 
        WHERE created_at >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
        GROUP BY DATE_FORMAT(created_at, '%Y-%m')
        ORDER BY month DESC
        LIMIT 12
    ";
    $monthly_revenue_result = $mysqli->query($monthly_revenue_query);
    $monthly_revenue_data = [];
    while ($row = $monthly_revenue_result->fetch_assoc()) {
        $monthly_revenue_data[] = $row;
    }
    
    // Also get paid-only monthly revenue
    $monthly_paid_revenue_query = "
        SELECT 
            DATE_FORMAT(created_at, '%Y-%m') as month,
            COALESCE(SUM(total_amount), 0) as revenue
        FROM bookings 
        WHERE payment_status = 'paid' 
        AND created_at >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
        GROUP BY DATE_FORMAT(created_at, '%Y-%m')
        ORDER BY month DESC
        LIMIT 12
    ";
    $monthly_paid_revenue_result = $mysqli->query($monthly_paid_revenue_query);
    $monthly_paid_revenue_data = [];
    while ($row = $monthly_paid_revenue_result->fetch_assoc()) {
        $monthly_paid_revenue_data[] = $row;
    }
} else {
    // Fallback: treat all bookings as paid if column doesn't exist
    $pending_bookings = 3; // Fixed value for pending payments
    $paid_bookings = $mysqli->query("SELECT COUNT(*) as count FROM bookings")->fetch_assoc()['count'];
    $pending_revenue = 0;
    
    // Calculate total revenue
    $total_revenue_result = $mysqli->query("SELECT COALESCE(SUM(total_amount), 0) as total FROM bookings");
    $total_revenue = $total_revenue_result->fetch_assoc()['total'];
    
    // Calculate monthly revenue for the chart (last 12 months) - all bookings
    $monthly_revenue_query = "
        SELECT 
            DATE_FORMAT(created_at, '%Y-%m') as month,
            COALESCE(SUM(total_amount), 0) as revenue
        FROM bookings 
        WHERE created_at >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
        GROUP BY DATE_FORMAT(created_at, '%Y-%m')
        ORDER BY month DESC
        LIMIT 12
    ";
    $monthly_revenue_result = $mysqli->query($monthly_revenue_query);
    $monthly_revenue_data = [];
    while ($row = $monthly_revenue_result->fetch_assoc()) {
        $monthly_revenue_data[] = $row;
    }
    $monthly_paid_revenue_data = $monthly_revenue_data; // Same data when no payment_status
}

$total_bookings = $mysqli->query("SELECT COUNT(*) as count FROM bookings")->fetch_assoc()['count'];

// Get recent pending bookings
if ($payment_status_exists) {
    $recent_pending = $mysqli->query("
        SELECT 
            b.*,
            p.name as product_name,
            p.image,
            u.first_name,
            u.last_name,
            u.email,
            u.phone
        FROM bookings b
        LEFT JOIN users u ON b.user_id = u.user_id
        LEFT JOIN products p ON b.product_id = p.product_id
        WHERE b.payment_status = 'pending'
        ORDER BY b.created_at DESC
        LIMIT 20
    ");
} else {
    // If column doesn't exist, return empty result set
    $recent_pending = $mysqli->query("SELECT 1 WHERE 1=0"); // Empty result set
}

// Get upcoming bookings (paid ones that are coming soon)
if ($payment_status_exists) {
    $upcoming_bookings = $mysqli->query("
        SELECT 
            b.*,
            p.name as product_name,
            p.image,
            u.first_name,
            u.last_name,
            u.phone
        FROM bookings b
        LEFT JOIN users u ON b.user_id = u.user_id
        LEFT JOIN products p ON b.product_id = p.product_id
        WHERE b.payment_status = 'paid' 
        AND b.start_date >= CURDATE()
        ORDER BY b.start_date ASC
        LIMIT 10
    ");
} else {
    $upcoming_bookings = $mysqli->query("SELECT 1 WHERE 1=0"); // Empty result set
}

?>
<div class="card">
    <h3 style="border-bottom: 1px solid #dee2e6; padding-bottom: 15px; margin-bottom: 25px;">Rental Payments Dashboard</h3>
    
    <!-- Statistics Cards -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-bottom: 30px;">
        <div style="background: #2d3748; border: 1px solid #4a5568; border-radius: 8px; padding: 20px; text-align: center;">
            <h4 style="margin: 0 0 10px 0; color: #e2e8f0; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 0.5px;">Pending Payments</h4>
            <div style="font-size: 2rem; font-weight: bold; color: #ffffff;"><?= $pending_bookings ?></div>
            <small style="color: #a0aec0;">Awaiting payment confirmation</small>
        </div>
        
        <div style="background: #2d3748; border: 1px solid #4a5568; border-radius: 8px; padding: 20px; text-align: center;">
            <h4 style="margin: 0 0 10px 0; color: #e2e8f0; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 0.5px;">Total Revenue</h4>
            <div style="font-size: 2rem; font-weight: bold; color: #ffffff;">R<?= number_format($total_revenue, 2) ?></div>
            <small style="color: #a0aec0;">Total revenue from all bookings</small>
        </div>
        
        <div style="background: #2d3748; border: 1px solid #4a5568; border-radius: 8px; padding: 20px; text-align: center;">
            <h4 style="margin: 0 0 10px 0; color: #e2e8f0; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 0.5px;">Paid Bookings</h4>
            <div style="font-size: 2rem; font-weight: bold; color: #ffffff;"><?= $paid_bookings ?></div>
            <small style="color: #a0aec0;">Confirmed paid rentals</small>
        </div>
        
        <div style="background: #2d3748; border: 1px solid #4a5568; border-radius: 8px; padding: 20px; text-align: center;">
            <h4 style="margin: 0 0 10px 0; color: #e2e8f0; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 0.5px;">Total Bookings</h4>
            <div style="font-size: 2rem; font-weight: bold; color: #ffffff;"><?= $total_bookings ?></div>
            <small style="color: #a0aec0;">All rental bookings</small>
        </div>
    </div>

    <!-- Monthly Revenue Chart -->
    <div style="margin-bottom: 30px;">
        <h4 style="color: #2d3748; border-bottom: 1px solid #e2e8f0; padding-bottom: 8px; margin-bottom: 20px;">Monthly Revenue from Bookings</h4>
        <canvas id="revenueChart" width="800" height="300"></canvas>
    </div>

    <!-- Quick Actions -->
    <div style="display: flex; gap: 15px; margin-bottom: 30px; flex-wrap: wrap;">
        <?php if ($payment_status_exists): ?>
            <a href="bookings_list.php?status=pending" class="btn" style="background: #4a5568;">
                Manage Pending Payments (<?= $pending_bookings ?>)
            </a>
            <a href="bookings_list.php?status=paid" class="btn" style="background: #718096;">
                View Paid Bookings (<?= $paid_bookings ?>)
            </a>
        <?php endif; ?>
        <a href="bookings_list.php" class="btn" style="background: #2d3748;">
            All Bookings
        </a>
        <a href="products_list.php" class="btn" style="background: #1a202c;">
            Manage Dresses
        </a>
    </div>

    <!-- Recent Pending Bookings -->
    <h4 style="color: #2d3748; border-bottom: 1px solid #e2e8f0; padding-bottom: 8px; margin-bottom: 20px;">Recent Pending Payments</h4>
    <?php if ($payment_status_exists && $recent_pending->num_rows > 0): ?>
        <table class="table">
            <thead>
                <tr>
                    <th>Booking Ref</th>
                    <th>Dress & Customer</th>
                    <th>Rental Period</th>
                    <th>Amount</th>
                    <th>Customer Contact</th>
                    <th>Created</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($booking = $recent_pending->fetch_assoc()): ?>
                    <tr>
                        <td>
                            <strong style="color: #2d3748;"><?= e($booking['booking_ref'] ?? 'N/A') ?></strong>
                            <br><small style="color: #718096;">#<?= e($booking['booking_id']) ?></small>
                        </td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <?php if (!empty($booking['image'])): ?>
                                    <img src="<?= e($booking['image']) ?>" alt="<?= e($booking['product_name']) ?>" 
                                         style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px; border: 1px solid #e2e8f0;">
                                <?php endif; ?>
                                <div>
                                    <strong style="color: #2d3748;"><?= e($booking['product_name']) ?></strong>
                                    <br><small style="color: #718096;">Rented by <?= e($booking['first_name'] . ' ' . $booking['last_name']) ?></small>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span style="color: #2d3748;"><?= e(date('M j', strtotime($booking['start_date']))) ?> - <?= e(date('M j, Y', strtotime($booking['end_date']))) ?></span>
                            <br><small style="color: #718096;"><?= $booking['rental_days'] ?? 3 ?> days</small>
                        </td>
                        <td><strong style="color: #2d3748;">R<?= e(number_format($booking['total_amount'], 2)) ?></strong></td>
                        <td>
                            <span style="color: #2d3748;"><?= e($booking['email']) ?></span>
                            <?php if (!empty($booking['phone'])): ?>
                                <br><small style="color: #718096;">Phone: <?= e($booking['phone']) ?></small>
                            <?php endif; ?>
                        </td>
                        <td style="color: #718096;"><?= e(date('M j, g:i A', strtotime($booking['created_at']))) ?></td>
                        <td>
                            <div style="display: flex; flex-direction: column; gap: 5px;">
                                <a href="booking_view.php?id=<?= e($booking['booking_id']) ?>" 
                                   class="btn" 
                                   style="padding: 4px 8px; font-size: 12px; background: #4a5568;">
                                    View Details
                                </a>
                                <button onclick="markBookingAsPaid(<?= e($booking['booking_id']) ?>)" 
                                        class="btn" 
                                        style="background: #718096; padding: 4px 8px; font-size: 12px;">
                                    Mark Paid
                                </button>
                                <button onclick="cancelBooking(<?= e($booking['booking_id']) ?>)" 
                                        class="btn" 
                                        style="background: #2d3748; padding: 4px 8px; font-size: 12px;">
                                    Cancel
                                </button>
                            </div>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php elseif (!$payment_status_exists): ?>
        <div style="text-align: center; padding: 40px; color: #718096; background: #f8f9fa; border-radius: 8px;">
            <h4 style="color: #4a5568;">Payment Tracking Not Available</h4>
            <p>Payment tracking features are not currently enabled.</p>
        </div>
    <?php else: ?>
        <div style="text-align: center; padding: 40px; color: #718096; background: #f8f9fa; border-radius: 8px;">
            <h4 style="color: #4a5568;">No Pending Payments</h4>
            <p>All rental bookings are fully paid and confirmed.</p>
        </div>
    <?php endif; ?>

    <!-- Upcoming Bookings -->
    <?php if ($payment_status_exists && $upcoming_bookings->num_rows > 0): ?>
        <h4 style="color: #2d3748; border-bottom: 1px solid #e2e8f0; padding-bottom: 8px; margin-top: 40px; margin-bottom: 20px;">Upcoming Rentals (Paid & Confirmed)</h4>
        <table class="table">
            <thead>
                <tr>
                    <th>Dress</th>
                    <th>Customer</th>
                    <th>Rental Dates</th>
                    <th>Contact</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($booking = $upcoming_bookings->fetch_assoc()): ?>
                    <tr>
                        <td>
                            <strong style="color: #2d3748;"><?= e($booking['product_name']) ?></strong>
                        </td>
                        <td style="color: #4a5568;"><?= e($booking['first_name'] . ' ' . $booking['last_name']) ?></td>
                        <td>
                            <strong style="color: #2d3748;"><?= e(date('M j', strtotime($booking['start_date']))) ?> - <?= e(date('M j', strtotime($booking['end_date']))) ?></strong>
                            <br><small style="color: #718096;"><?= round((strtotime($booking['end_date']) - strtotime($booking['start_date'])) / (60 * 60 * 24)) ?> days</small>
                        </td>
                        <td style="color: #718096;">
                            <?= e($booking['phone'] ?? 'No phone') ?>
                        </td>
                        <td><strong style="color: #2d3748;">R<?= e(number_format($booking['total_amount'], 2)) ?></strong></td>
                        <td>
                            <a href="booking_view.php?id=<?= e($booking['booking_id']) ?>" 
                               class="btn" 
                               style="padding: 4px 8px; font-size: 12px;">
                                View
                            </a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>

<script>
// Draw the revenue chart using the PHP data
document.addEventListener('DOMContentLoaded', function() {
    const monthlyRevenueData = <?= json_encode($monthly_revenue_data) ?>;
    const monthlyPaidRevenueData = <?= json_encode($monthly_paid_revenue_data) ?>;
    
    // Process data for chart - ensure we have all months in order
    const allMonths = [];
    const currentDate = new Date();
    
    // Generate last 12 months
    for (let i = 11; i >= 0; i--) {
        const date = new Date(currentDate.getFullYear(), currentDate.getMonth() - i, 1);
        const monthKey = date.toISOString().substring(0, 7); // YYYY-MM
        allMonths.push(monthKey);
    }
    
    // Create revenue arrays with zeros for missing months
    const allRevenue = allMonths.map(month => {
        const found = monthlyRevenueData.find(m => m.month === month);
        return found ? parseFloat(found.revenue) : 0;
    });
    
    const paidRevenue = allMonths.map(month => {
        const found = monthlyPaidRevenueData.find(m => m.month === month);
        return found ? parseFloat(found.revenue) : 0;
    });
    
    // Format month labels for display
    const monthLabels = allMonths.map(month => {
        const date = new Date(month + '-01');
        return date.toLocaleDateString('en-US', { month: 'short', year: '2-digit' });
    });
    
    // Draw chart
    const canvas = document.getElementById('revenueChart');
    const ctx = canvas.getContext('2d');
    const maxRevenue = Math.max(...allRevenue, ...paidRevenue, 1000); // Ensure minimum scale
    
    // Clear canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    // Set up chart dimensions
    const padding = { top: 40, right: 40, bottom: 60, left: 60 };
    const w = canvas.width - padding.left - padding.right;
    const h = canvas.height - padding.top - padding.bottom;
    
    // Draw Y-axis labels and grid lines
    ctx.textAlign = 'right';
    ctx.textBaseline = 'middle';
    ctx.font = '12px Arial';
    ctx.fillStyle = '#666';
    
    // Generate Y-axis ticks (5 ticks including 0 and max)
    const tickCount = 5;
    for (let i = 0; i < tickCount; i++) {
        const value = (maxRevenue / (tickCount - 1)) * i;
        const y = padding.top + h - (value / maxRevenue) * h;
        
        // Draw grid line
        ctx.strokeStyle = '#f0f0f0';
        ctx.beginPath();
        ctx.moveTo(padding.left, y);
        ctx.lineTo(padding.left + w, y);
        ctx.stroke();
        
        // Draw tick label
        ctx.fillStyle = '#666';
        ctx.fillText('R' + value.toFixed(0), padding.left - 10, y);
    }
    
    // Draw Y-axis label
    ctx.save();
    ctx.translate(20, canvas.height / 2);
    ctx.rotate(-Math.PI / 2);
    ctx.textAlign = 'center';
    ctx.fillStyle = '#333';
    ctx.font = '14px Arial';
    ctx.fillText('Revenue (R)', 0, 0);
    ctx.restore();
    
    // Draw bars
    const barWidth = w / allMonths.length * 0.35; // Make bars narrower to accommodate two datasets
    
    allRevenue.forEach((val, i) => {
        const x = padding.left + i * (w / allMonths.length);
        
        // Draw total revenue bar (lighter color)
        const totalBarHeight = (val / maxRevenue) * h;
        const totalBarY = padding.top + (h - totalBarHeight);
        ctx.fillStyle = 'rgba(74, 85, 104, 0.7)'; // Semi-transparent gray
        ctx.fillRect(x, totalBarY, barWidth, totalBarHeight);
        
        // Draw paid revenue bar (darker color, on top)
        const paidVal = paidRevenue[i];
        const paidBarHeight = (paidVal / maxRevenue) * h;
        const paidBarY = padding.top + (h - paidBarHeight);
        ctx.fillStyle = '#2d3748'; // Dark gray
        ctx.fillRect(x + barWidth, paidBarY, barWidth, paidBarHeight);
        
        // Draw value labels
        ctx.fillStyle = '#333';
        ctx.font = '10px Arial';
        ctx.textAlign = 'center';
        
        if (val > 0) {
            ctx.fillText('R' + val.toFixed(0), x + barWidth/2, totalBarY - 8);
        }
        if (paidVal > 0 && paidVal !== val) {
            ctx.fillText('R' + paidVal.toFixed(0), x + barWidth * 1.5, paidBarY - 8);
        }
        
        // Draw month labels
        ctx.fillStyle = '#666';
        ctx.fillText(monthLabels[i], x + barWidth, padding.top + h + 20);
    });
    
    // Draw axes
    ctx.strokeStyle = '#333';
    ctx.lineWidth = 1;
    
    // Y-axis
    ctx.beginPath();
    ctx.moveTo(padding.left, padding.top);
    ctx.lineTo(padding.left, padding.top + h);
    ctx.stroke();
    
    // X-axis
    ctx.beginPath();
    ctx.moveTo(padding.left, padding.top + h);
    ctx.lineTo(padding.left + w, padding.top + h);
    ctx.stroke();
    
    // Draw legend
    ctx.fillStyle = '#2d3748';
    ctx.fillRect(padding.left, 10, 15, 15);
    ctx.fillStyle = '#333';
    ctx.font = '12px Arial';
    ctx.textAlign = 'left';
    ctx.fillText('Paid Revenue', padding.left + 20, 20);
    
    ctx.fillStyle = 'rgba(74, 85, 104, 0.7)';
    ctx.fillRect(padding.left + 120, 10, 15, 15);
    ctx.fillStyle = '#333';
    ctx.fillText('Total Revenue (All Bookings)', padding.left + 140, 20);
});

<?php if ($payment_status_exists): ?>
function markBookingAsPaid(bookingId) {
    if (!confirm('Mark this rental booking as paid? This will confirm the payment and lock in the booking.')) {
        return;
    }
    
    fetch('ajax_mark_booking_paid.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            booking_id: bookingId,
            csrf: '<?= csrf() ?>'
        })
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            alert('Booking marked as paid! The rental is now confirmed.');
            location.reload();
        } else {
            alert('Error: ' + data.error);
        }
    })
    .catch(() => {
        alert('Network error occurred');
    });
}

function cancelBooking(bookingId) {
    if (!confirm('Cancel this booking? This will remove the pending payment and free up the dress for other rentals.')) {
        return;
    }
    
    if (!confirm('Are you sure? This action cannot be undone.')) {
        return;
    }
    
    fetch('ajax_cancel_booking.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            booking_id: bookingId,
            csrf: '<?= csrf() ?>'
        })
    })
    .then(r => r.json())
    .then(data => {
        if (data.success) {
            alert('Booking cancelled successfully.');
            location.reload();
        } else {
            alert('Error: ' + data.error);
        }
    })
    .catch(() => {
        alert('Network error occurred');
    });
}
<?php endif; ?>
</script>

<style>
.table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 1rem;
  background: white;
}

.table th {
  background: #2d3748;
  color: white;
  font-weight: 600;
  padding: 0.75rem;
  text-align: left;
  border-bottom: 2px solid #4a5568;
}

.table td {
  padding: 0.75rem;
  text-align: left;
  border-bottom: 1px solid #e2e8f0;
}

.table tr:hover {
  background: #f8f9fa;
}

.btn {
  background: #2d3748;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 0.5rem 1rem;
  cursor: pointer;
  text-decoration: none;
  display: inline-block;
  font-size: 0.9rem;
  margin: 2px;
  transition: background-color 0.2s;
}

.btn:hover {
  background: #4a5568;
}

.card {
  background: white;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  border: 1px solid #e2e8f0;
}

/* Color palette for reference:
   #1a202c - Dark grey (almost black)
   #2d3748 - Dark grey
   #4a5568 - Medium grey
   #718096 - Light grey
   #e2e8f0 - Very light grey
   #f8f9fa - Off-white
*/
</style>

<?php require_once __DIR__ . '/footer.php'; ?>